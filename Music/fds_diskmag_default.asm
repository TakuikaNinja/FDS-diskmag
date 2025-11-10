_default_Intro_header:
	.byte 7
	.byte 150
	.byte 16
	.word _default_Intro_pulse1
	.word _default_Intro_pulse2
	.word _default_Intro_triangle
	.word _default_Intro_noise
	.word NULL_DMC

_default_Intro_pulse1:
	.word _default_Intro_pulse1_pattern4
	.word _default_Intro_pulse1_pattern4
	.word _default_Intro_pulse1_pattern4
	.word _default_Intro_pulse1_pattern4
	.word _default_Intro_pulse1_pattern0
	.word _default_Intro_pulse1_pattern1
	.word _default_Intro_pulse1_pattern0
	.word _default_Intro_pulse1_pattern1
	.word _default_Intro_pulse1_pattern1
	.word _default_Intro_pulse1_pattern2
	.word _default_Intro_pulse1_pattern3
	.word _default_Intro_pulse1_pattern3
	.word _default_Intro_pulse1_pattern1
	.word _default_Intro_pulse1_pattern2
	.word _default_Intro_pulse1_pattern3
	.word _default_Intro_pulse1_pattern3
_default_Intro_pulse1_pattern0:
	.byte NL3,INST|CONT|6,A2,A2,C3,NL1,C3,AS2,NL5,A2
	.byte D00
_default_Intro_pulse1_pattern1:
	.byte NL3,INST|CONT|6,A2,A2,C3,NL1,C3,AS2,NL3,A2
	.byte NL2,AS2,D00
_default_Intro_pulse1_pattern2:
	.byte NL3,INST|CONT|6,AS2,F3,AS3,NL1,AS3,A3,NL3,G3
	.byte NL2,F3,D00
_default_Intro_pulse1_pattern3:
	.byte NL3,INST|CONT|6,A3,C3,D3,NL2,A2,NL1,AS2,NL4
	.byte A2,D00
_default_Intro_pulse1_pattern4:
	.byte NL16,INST|SLNT,D00

_default_Intro_pulse2:
	.word _default_Intro_pulse2_pattern5
	.word _default_Intro_pulse2_pattern5
	.word _default_Intro_pulse2_pattern5
	.word _default_Intro_pulse2_pattern5
	.word _default_Intro_pulse2_pattern0
	.word _default_Intro_pulse2_pattern1
	.word _default_Intro_pulse2_pattern0
	.word _default_Intro_pulse2_pattern1
	.word _default_Intro_pulse2_pattern2
	.word _default_Intro_pulse2_pattern3
	.word _default_Intro_pulse2_pattern4
	.word _default_Intro_pulse2_pattern4
	.word _default_Intro_pulse2_pattern2
	.word _default_Intro_pulse2_pattern3
	.word _default_Intro_pulse2_pattern4
	.word _default_Intro_pulse2_pattern4
_default_Intro_pulse2_pattern0:
	.byte NL3,INST|CONT|6,C3,F3,AS3,NL1,A3,G3,NL5,F3
	.byte D00
_default_Intro_pulse2_pattern1:
	.byte NL3,INST|CONT|6,C3,F3,AS3,NL1,A3,G3,NL3,F3
	.byte NL2,D3,D00
_default_Intro_pulse2_pattern2:
	.byte NL3,INST|CONT|6,C3,F3,AS3,NL1,A3,G3,NL3,F3
	.byte NL2,G3,D00
_default_Intro_pulse2_pattern3:
	.byte NL3,INST|CONT|6,G3,C4,DS4,NL1,D4,C4,NL3,AS3
	.byte NL2,C4,D00
_default_Intro_pulse2_pattern4:
	.byte NL3,INST|CONT|6,C4,A3,AS3,NL2,F3,NL1,D3,NL4
	.byte F3,D00
_default_Intro_pulse2_pattern5:
	.byte NL16,INST|SLNT,D00

_default_Intro_triangle:
	.word _default_Intro_triangle_pattern0
	.word _default_Intro_triangle_pattern1
	.word _default_Intro_triangle_pattern0
	.word _default_Intro_triangle_pattern1
	.word _default_Intro_triangle_pattern0
	.word _default_Intro_triangle_pattern1
	.word _default_Intro_triangle_pattern0
	.word _default_Intro_triangle_pattern1
	.word _default_Intro_triangle_pattern0
	.word _default_Intro_triangle_pattern1
	.word _default_Intro_triangle_pattern0
	.word _default_Intro_triangle_pattern1
	.word _default_Intro_triangle_pattern0
	.word _default_Intro_triangle_pattern1
	.word _default_Intro_triangle_pattern0
	.word _default_Intro_triangle_pattern1
_default_Intro_triangle_pattern0:
	.byte NL1,INST|CONT|5,F2,NL2,INST|SLNT,INST|5,NL1,INST|SLNT,INST|5,INST|SLNT
	.byte INST|5,NL3,INST|SLNT,NL2,INST|5,NL1,INST|SLNT,INST|CONT|5,DS2,D00
_default_Intro_triangle_pattern1:
	.byte NL1,INST|CONT|5,F2,INST|SLNT,NL2,INST|5,NL1,INST|SLNT,NL2,INST|5
	.byte NL1,INST|SLNT,INST|5,NL3,INST|SLNT,NL2,INST|5,INST|SLNT,D00

_default_Intro_noise:
	.word _default_Intro_noise_pattern0
	.word _default_Intro_noise_pattern0
	.word _default_Intro_noise_pattern0
	.word _default_Intro_noise_pattern3
	.word _default_Intro_noise_pattern1
	.word _default_Intro_noise_pattern1
	.word _default_Intro_noise_pattern1
	.word _default_Intro_noise_pattern2
	.word _default_Intro_noise_pattern1
	.word _default_Intro_noise_pattern1
	.word _default_Intro_noise_pattern1
	.word _default_Intro_noise_pattern2
	.word _default_Intro_noise_pattern1
	.word _default_Intro_noise_pattern1
	.word _default_Intro_noise_pattern1
	.word _default_Intro_noise_pattern2
_default_Intro_noise_pattern0:
	.byte NL1,INST|CONT|1,$0,INST|CONT|3,$F,NL2,INST|CONT|4,$E,NL1,INST|CONT|1
	.byte $0,INST|CONT|3,$F,NL2,INST|CONT|4,$E,NL1,INST|CONT|1,$0,INST|CONT|3
	.byte $F,NL2,INST|CONT|4,$E,NL1,INST|CONT|1,$0,INST|CONT|3,$F,NL2
	.byte INST|CONT|4,$E,D00
_default_Intro_noise_pattern1:
	.byte NL1,INST|CONT|1,$0,INST|CONT|3,$F,NL2,INST|CONT|4,$E,INST|CONT|2,$0
	.byte NL1,INST|CONT|4,$E,INST|CONT|2,$0,INST|1,INST|2,NL2,INST|CONT|4,$E
	.byte INST|CONT|2,$0,INST|CONT|4,$E,D00
_default_Intro_noise_pattern2:
	.byte NL1,INST|CONT|1,$0,INST|CONT|3,$F,NL2,INST|CONT|4,$E,INST|CONT|2,$0
	.byte NL1,INST|CONT|4,$E,INST|CONT|2,$0,INST|1,INST|2,NL2,INST|CONT|4,$E
	.byte INST|CONT|2,$0,NL1,INST|CONT|4,$E,INST|CONT|2,$0,D00
_default_Intro_noise_pattern3:
	.byte NL1,INST|CONT|1,$0,INST|CONT|3,$F,NL2,INST|CONT|4,$E,NL1,INST|CONT|1
	.byte $0,INST|CONT|3,$F,NL2,INST|CONT|4,$E,NL1,INST|CONT|1,$0,INST|CONT|3
	.byte $F,NL2,INST|CONT|4,$E,NL1,INST|CONT|1,$0,INST|CONT|3,$F,NL2
	.byte INST|CONT|1,$0,D00

_default_Reading_header:
	.byte 8
	.byte 150
	.byte 32
	.word _default_Reading_pulse1
	.word _default_Reading_pulse2
	.word _default_Reading_triangle
	.word _default_Reading_noise
	.word NULL_DMC

_default_Reading_pulse1:
	.word _default_Reading_pulse1_pattern0
	.word _default_Reading_pulse1_pattern0
	.word _default_Reading_pulse1_pattern0
	.word _default_Reading_pulse1_pattern0
	.word _default_Reading_pulse1_pattern1
	.word _default_Reading_pulse1_pattern2
	.word _default_Reading_pulse1_pattern3
	.word _default_Reading_pulse1_pattern2
	.word _default_Reading_pulse1_pattern4
	.word _default_Reading_pulse1_pattern5
	.word _default_Reading_pulse1_pattern6
	.word _default_Reading_pulse1_pattern7
	.word _default_Reading_pulse1_pattern8
	.word _default_Reading_pulse1_pattern9
	.word _default_Reading_pulse1_pattern10
	.word _default_Reading_pulse1_pattern11
	.word _default_Reading_pulse1_pattern1
	.word _default_Reading_pulse1_pattern2
	.word _default_Reading_pulse1_pattern3
	.word _default_Reading_pulse1_pattern2
	.word _default_Reading_pulse1_pattern1
	.word _default_Reading_pulse1_pattern2
	.word _default_Reading_pulse1_pattern3
	.word _default_Reading_pulse1_pattern2
	.word _default_Reading_pulse1_pattern12
	.word _default_Reading_pulse1_pattern13
	.word _default_Reading_pulse1_pattern14
	.word _default_Reading_pulse1_pattern15
	.word _default_Reading_pulse1_pattern16
	.word _default_Reading_pulse1_pattern13
	.word _default_Reading_pulse1_pattern17
	.word _default_Reading_pulse1_pattern18
_default_Reading_pulse1_pattern0:
	.byte NL16,INST|SLNT,D00
_default_Reading_pulse1_pattern1:
	.byte NL2,INST|CONT|6,B1,B1,B2,B1,NL1,B1,NL2,B1
	.byte B2,B1,NL1,B1,D00
_default_Reading_pulse1_pattern2:
	.byte NL2,INST|CONT|6,A1,A1,A2,A1,NL1,A1,NL2,A1
	.byte A2,A1,NL1,A1,D00
_default_Reading_pulse1_pattern3:
	.byte NL2,INST|CONT|6,FS1,FS1,FS2,FS1,NL1,FS1,NL2,FS1
	.byte FS2,FS1,NL1,FS1,D00
_default_Reading_pulse1_pattern4:
	.byte NL8,INST|CONT|8,B3,NL4,A3,FS3,D00
_default_Reading_pulse1_pattern5:
	.byte NL2,INST|CONT|8,E3,NL4,FS3,NL2,E3,NL6,CS3,NL2
	.byte INST|SLNT,D00
_default_Reading_pulse1_pattern6:
	.byte NL2,INST|CONT|8,CS3,E3,FS3,E3,NL4,FS3,E3,D00
_default_Reading_pulse1_pattern7:
	.byte NL10,INST|CONT|8,A3,NL2,INST|SLNT,NL4,INST|8,D00
_default_Reading_pulse1_pattern8:
	.byte NL8,INST|CONT|8,B3,NL4,A3,B3,D00
_default_Reading_pulse1_pattern9:
	.byte NL2,INST|CONT|8,CS4,B3,A3,NL8,FS3,NL2,INST|SLNT,D00
_default_Reading_pulse1_pattern10:
	.byte NL2,INST|CONT|8,CS3,E3,FS3,E3,NL4,CS3,B2,D00
_default_Reading_pulse1_pattern11:
	.byte NL10,INST|CONT|8,A2,NL6,INST|SLNT,D00
_default_Reading_pulse1_pattern12:
	.byte NL2,INST|CONT|7,CS5,B4,A4,NL6,GS4,NL4,FS4,D00
_default_Reading_pulse1_pattern13:
	.byte NL2,INST|CONT|7,B4,A4,GS4,NL10,E4,D00
_default_Reading_pulse1_pattern14:
	.byte NL6,INST|CONT|7,FS4,E4,NL4,FS4,D00
_default_Reading_pulse1_pattern15:
	.byte NL12,INST|CONT|7,GS4,NL4,B4,D00
_default_Reading_pulse1_pattern16:
	.byte NL2,INST|CONT|7,CS5,B4,A4,NL6,B4,NL4,A4,D00
_default_Reading_pulse1_pattern17:
	.byte NL6,INST|CONT|7,GS4,B4,NL4,A4,D00
_default_Reading_pulse1_pattern18:
	.byte NL6,INST|CONT|7,GS4,NL10,FS4,D00

_default_Reading_pulse2:
	.word _default_Reading_pulse2_pattern0
	.word _default_Reading_pulse2_pattern1
	.word _default_Reading_pulse2_pattern2
	.word _default_Reading_pulse2_pattern3
	.word _default_Reading_pulse2_pattern0
	.word _default_Reading_pulse2_pattern1
	.word _default_Reading_pulse2_pattern2
	.word _default_Reading_pulse2_pattern3
	.word _default_Reading_pulse2_pattern0
	.word _default_Reading_pulse2_pattern1
	.word _default_Reading_pulse2_pattern2
	.word _default_Reading_pulse2_pattern3
	.word _default_Reading_pulse2_pattern0
	.word _default_Reading_pulse2_pattern1
	.word _default_Reading_pulse2_pattern2
	.word _default_Reading_pulse2_pattern3
	.word _default_Reading_pulse2_pattern0
	.word _default_Reading_pulse2_pattern1
	.word _default_Reading_pulse2_pattern2
	.word _default_Reading_pulse2_pattern3
	.word _default_Reading_pulse2_pattern0
	.word _default_Reading_pulse2_pattern1
	.word _default_Reading_pulse2_pattern2
	.word _default_Reading_pulse2_pattern3
	.word _default_Reading_pulse2_pattern4
	.word _default_Reading_pulse2_pattern5
	.word _default_Reading_pulse2_pattern1
	.word _default_Reading_pulse2_pattern6
	.word _default_Reading_pulse2_pattern4
	.word _default_Reading_pulse2_pattern5
	.word _default_Reading_pulse2_pattern1
	.word _default_Reading_pulse2_pattern6
_default_Reading_pulse2_pattern0:
	.byte NL2,INST|CONT|7,B2,NL6,A2,NL8,A2,D00
_default_Reading_pulse2_pattern1:
	.byte NL2,INST|CONT|7,A2,NL6,FS2,NL8,FS2,D00
_default_Reading_pulse2_pattern2:
	.byte NL2,INST|CONT|7,FS2,NL6,E2,NL8,E2,D00
_default_Reading_pulse2_pattern3:
	.byte NL2,INST|CONT|7,FS2,NL6,A2,NL8,A2,D00
_default_Reading_pulse2_pattern4:
	.byte NL2,INST|CONT|7,CS3,NL6,B2,NL8,B2,D00
_default_Reading_pulse2_pattern5:
	.byte NL2,INST|CONT|7,B2,NL6,GS2,NL8,GS2,D00
_default_Reading_pulse2_pattern6:
	.byte NL2,INST|CONT|7,GS2,NL6,B2,NL8,B2,D00

_default_Reading_triangle:
	.word _default_Reading_triangle_pattern0
	.word _default_Reading_triangle_pattern1
	.word _default_Reading_triangle_pattern2
	.word _default_Reading_triangle_pattern1
	.word _default_Reading_triangle_pattern0
	.word _default_Reading_triangle_pattern1
	.word _default_Reading_triangle_pattern2
	.word _default_Reading_triangle_pattern1
	.word _default_Reading_triangle_pattern0
	.word _default_Reading_triangle_pattern1
	.word _default_Reading_triangle_pattern2
	.word _default_Reading_triangle_pattern1
	.word _default_Reading_triangle_pattern0
	.word _default_Reading_triangle_pattern1
	.word _default_Reading_triangle_pattern2
	.word _default_Reading_triangle_pattern1
	.word _default_Reading_triangle_pattern0
	.word _default_Reading_triangle_pattern1
	.word _default_Reading_triangle_pattern2
	.word _default_Reading_triangle_pattern1
	.word _default_Reading_triangle_pattern0
	.word _default_Reading_triangle_pattern1
	.word _default_Reading_triangle_pattern2
	.word _default_Reading_triangle_pattern1
	.word _default_Reading_triangle_pattern3
	.word _default_Reading_triangle_pattern0
	.word _default_Reading_triangle_pattern1
	.word _default_Reading_triangle_pattern0
	.word _default_Reading_triangle_pattern3
	.word _default_Reading_triangle_pattern0
	.word _default_Reading_triangle_pattern1
	.word _default_Reading_triangle_pattern0
_default_Reading_triangle_pattern0:
	.byte NL1,INST|CONT|5,B1,INST|SLNT,NL2,INST|5,NL1,B2,INST|SLNT,INST|CONT|5
	.byte B1,INST|SLNT,INST|5,B1,INST|SLNT,INST|CONT|5,B2,INST|SLNT,NL2,INST|CONT|5
	.byte B1,NL1,B1,D00
_default_Reading_triangle_pattern1:
	.byte NL1,INST|CONT|5,A1,INST|SLNT,NL2,INST|5,NL1,A2,INST|SLNT,INST|CONT|5
	.byte A1,INST|SLNT,INST|5,A1,INST|SLNT,INST|CONT|5,A2,INST|SLNT,NL2,INST|CONT|5
	.byte A1,NL1,A1,D00
_default_Reading_triangle_pattern2:
	.byte NL1,INST|CONT|5,FS1,INST|SLNT,NL2,INST|5,NL1,FS2,INST|SLNT,INST|CONT|5
	.byte FS1,INST|SLNT,INST|5,FS1,INST|SLNT,INST|CONT|5,FS2,INST|SLNT,NL2,INST|CONT|5
	.byte FS1,NL1,FS1,D00
_default_Reading_triangle_pattern3:
	.byte NL1,INST|CONT|5,CS2,INST|SLNT,NL2,INST|5,NL1,CS3,INST|SLNT,INST|CONT|5
	.byte CS2,INST|SLNT,INST|5,CS2,INST|SLNT,INST|CONT|5,CS3,INST|SLNT,NL2,INST|CONT|5
	.byte CS2,NL1,CS2,D00

_default_Reading_noise:
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern1
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern1
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern1
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern1
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern1
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern1
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern1
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern0
	.word _default_Reading_noise_pattern1
_default_Reading_noise_pattern0:
	.byte NL1,INST|CONT|1,$0,INST|CONT|3,$F,NL2,INST|CONT|4,$E,NL1,INST|CONT|2
	.byte $0,INST|CONT|4,$F,NL2,INST|CONT|1,$0,NL1,$0,$0,INST|CONT|3
	.byte $F,INST|CONT|2,$0,INST|CONT|4,$F,NL2,INST|CONT|1,$0,NL1,$0
	.byte D00
_default_Reading_noise_pattern1:
	.byte NL1,INST|CONT|1,$0,INST|CONT|3,$F,NL2,INST|CONT|4,$E,NL1,INST|CONT|2
	.byte $0,INST|CONT|4,$F,NL2,INST|CONT|1,$0,NL1,$0,$0,INST|CONT|3
	.byte $F,INST|CONT|2,$0,INST|CONT|4,$F,NL2,INST|CONT|1,$0,NL1,INST|2
	.byte D00

