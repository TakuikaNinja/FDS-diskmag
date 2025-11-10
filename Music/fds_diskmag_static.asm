sabre_maxTracks:
	.byte 2
sabre_maxSFX:
	.byte 0

trackHeaderTable_lo:
	.byte <_default_Intro_header
	.byte <_default_Reading_header
trackHeaderTable_hi:
	.byte >_default_Intro_header
	.byte >_default_Reading_header
trackTable_PRGbank:
	.byte $00,$00

sfxHeaderTable_lo:
sfxHeaderTable_hi:

;;;; Track index constants
	_default_Intro   = 0
	_default_Reading = 1

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
	.byte 6,1,0,ENV_LOOP,2
env10:
	.byte 4,1,0,9,10,11,ENV_LOOP,5
env11:
	.byte 12,0,ENV_LOOP,1
env12:
	.byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,255,1,1,1,1,255,255,ENV_LOOP,16
env13:
	.byte 96,64,64,64,64,64,64,64,64,64,64,64,64,64,96,64,ENV_LOOP,15
env14:
	.byte 64,64,64,32,ENV_LOOP,3
env15:
	.byte 96,0,ENV_LOOP,1

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

inst_silent:
	.word env0
	.word env0
	.word env0
	.word env0
inst_Kick:
	.word env2
	.word env9
	.word env0
	.word env0
inst_Snare:
	.word env4
	.word env10
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
	.word env11
	.word env0
	.word env0
inst_Pad:
	.word env6
	.word env0
	.word env0
	.word env13
inst_Pluck:
	.word env7
	.word env11
	.word env0
	.word env14
inst_Lead:
	.word env8
	.word env0
	.word env12
	.word env15

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

