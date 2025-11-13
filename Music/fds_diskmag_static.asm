sabre_maxTracks:
	.byte 2
sabre_maxSFX:
	.byte 1

trackHeaderTable_lo:
	.byte <_default_Intro_header
	.byte <_default_Reading_header
trackHeaderTable_hi:
	.byte >_default_Intro_header
	.byte >_default_Reading_header
trackTable_PRGbank:
	.byte $00,$00

sfxHeaderTable_lo:
	.byte <_sfx_Error_header
sfxHeaderTable_hi:
	.byte >_sfx_Error_header

;;;; Track index constants
	_default_Intro   = 0
	_default_Reading = 1
;;;; SFX index constants
	_sfx_Error = 0

env0:
	.byte 0,ENV_LOOP,0
env1:
	.byte 7,3,0,2,1,0,ENV_LOOP,5
env2:
	.byte 13,9,8,7,0,ENV_LOOP,4
env3:
	.byte 7,4,4,4,4,3,3,3,2,2,2,1,1,1,0,ENV_LOOP,14
env4:
	.byte 13,13,8,7,6,5,4,3,2,1,0,ENV_LOOP,10
env5:
	.byte 15,ENV_LOOP,0
env6:
	.byte 6,5,5,5,4,4,4,3,3,3,2,2,2,1,3,3,3,2,2,2,1,1,1,0,ENV_LOOP,23
env7:
	.byte 8,8,4,4,1,1,6,6,3,3,1,1,4,4,2,2,1,1,1,1,1,1,1,1,0,ENV_LOOP,24
env8:
	.byte 9,9,4,4,8,8,5,5,7,7,6,6,7,7,6,4,ENV_LOOP,15
env9:
	.byte 12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,0,ENV_LOOP,18
env10:
	.byte 6,1,0,ENV_LOOP,2
env11:
	.byte 4,1,0,9,10,11,ENV_LOOP,5
env12:
	.byte 12,0,ENV_LOOP,1
env13:
	.byte 0,6,ENV_LOOP,0
env14:
	.byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,255,1,1,1,1,255,255,ENV_LOOP,16
env15:
	.byte 96,64,64,64,64,64,64,64,64,64,64,64,64,64,96,64,ENV_LOOP,15
env16:
	.byte 64,64,64,32,ENV_LOOP,3
env17:
	.byte 96,0,ENV_LOOP,1
env18:
	.byte 32,ENV_LOOP,0

instrumentHeaderTable:
	.word inst_silent
	.word inst_Kick
	.word inst_Snare
	.word inst_Hat
	.word inst_OpenHat
	.word inst_Tri
	.word inst_Pad
	.word inst_Pluck
	.word inst_Lead
	.word inst_Error

inst_silent:
	.word env0
	.word env0
	.word env0
	.word env0
inst_Kick:
	.word env2
	.word env10
	.word env0
	.word env0
inst_Snare:
	.word env4
	.word env11
	.word env0
	.word env0
inst_Hat:
	.word env1
	.word env0
	.word env0
	.word env0
inst_OpenHat:
	.word env3
	.word env0
	.word env0
	.word env0
inst_Tri:
	.word env5
	.word env12
	.word env0
	.word env0
inst_Pad:
	.word env6
	.word env0
	.word env0
	.word env15
inst_Pluck:
	.word env7
	.word env12
	.word env0
	.word env16
inst_Lead:
	.word env8
	.word env0
	.word env14
	.word env17
inst_Error:
	.word env9
	.word env13
	.word env0
	.word env18

dpcm_sampleAddressTable:

dpcm_noteToSampleTable:
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
dpcm_noteToSampleRateAndFlags:
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
dpcm_noteToSampleLength:
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

_sfx_Error_header:
	.byte 8
	.byte 150
	.word NULL_pulse1
	.word _sfx_Error_pulse2
	.word NULL_triangle
	.word NULL_noise
_sfx_Error_pulse2:
	.byte NL4,INST|CONT|9,D3,D3,D3,D3,D3,END_SFX

