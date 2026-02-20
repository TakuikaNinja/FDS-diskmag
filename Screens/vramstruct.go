/* VRAM struct compressor

by TakuikaNinja

Compress PPU data (CHR data, nametable tiles, etc) into the FDS BIOS VRAM struct format

Usage:
go run vramstruct.go in_file ppu_dest

ppu_dest is a uint16 in hexadecimal format (0000-FFFF supported, 0000-3FFF typical)

Limitatons:
- +1 increment mode (going across) only
- no substructures

Examples:
go run vramstruct.go intro.nam 2000

go run vramstruct.go tiles.chr 0000

*/

package main

import (
	"fmt"
	"os"
	"strconv"
)

func main() {
	var args = os.Args
	if len(args) != 3 {
		panic("Arguments: filename string, baseAddress uint16")
	}
	filename := args[1]
	baseAddress, err := strconv.ParseUint(args[2], 16, 16)
	checkError(err)
	inFile, err := os.ReadFile(filename)
	checkError(err)
	fmt.Printf("%s: %v bytes\n", filename, len(inFile))
	outFile := Compress(inFile, uint16(baseAddress))
	err = os.WriteFile(filename + ".out", outFile, 0666)
	checkError(err)
	fmt.Printf("%s.out: %v bytes\n", filename, len(outFile))
}

func checkError(err error) {
	if err != nil {
		panic(err)
	}
}

func consecutive(data []byte, i int) int {
	c := data[i]
	var count int = 0
	for (i+count) < len(data) && c == data[i+count] {
		count++
	}
	return min(count, 64)
}

func Compress(data []byte, baseAddress uint16) []byte {
	chunks := make([]Chunk, 0)
	var chunk Chunk
	address := baseAddress
	var run int
	
	for len(data) > 0 {
		run = consecutive(data, 0)
		if run > 2 {
			// RLE chunk
			chunk = NewChunk(address, true, byte(run), []byte{data[0]})
		} else {
			// find next RLE
			run = min(len(data), 64)
			for i := 1; i < run; i++ {
				if consecutive(data, i) > 2 {
					run = i
					break
				}
			}
			// non-RLE chunk
			chunk = NewChunk(address, false, byte(run), data[:run])
		}
		// append chunk
		chunks = append(chunks, chunk)
		data = data[run:]
		
		// update address
		address += uint16(run)
	}
	
	// unpack chunks into byte slice
	compressed := make([]byte, 0)
	for _, chunk := range chunks {
		//fmt.Printf("%#v\n", chunk)
		compressed = append(compressed, chunk.toBytes()...)
	}
	
	// append terminator and return
	compressed = append(compressed, byte(0xFF))
	return compressed
}

type Chunk struct {
	Address uint16
	Vertical bool
	Fill bool
	Length byte
	Data []byte
}

func NewChunk(address uint16, fill bool, length byte, data []byte) Chunk {
	chunk := Chunk{}
	chunk.Address = address
	chunk.Vertical = false
	chunk.Fill = fill
	chunk.Length = length
	chunk.Data = data
	return chunk
}

func (c Chunk) toBytes() []byte {
	out := make([]byte, 0, 4)
	out = append(out, byte(c.Address >> 8), byte(c.Address & 0xFF))
	flags := c.Length & byte(63)
	if c.Vertical {
		flags |= byte(0b10000000)
	}
	if c.Fill {
		flags |= byte(0b01000000)
	}
	out = append(out, flags)
	out = append(out, c.Data...)
	return out
}

