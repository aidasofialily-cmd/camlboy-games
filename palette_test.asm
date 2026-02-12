INCLUDE "include/hardware.inc"

SECTION "Header", ROM0[$100]
    jp Start
    ds $150 - @, 0

Start:
    ; Wait for VBlank to safely modify VRAM
.waitVBlank
    ld a, [rLY]
    cp 144
    jr c, .waitVBlank

    ; Fill Background with a gradient of tiles
    ld hl, _VRAM
    ld bc, 1024
.fillLoop:
    ld [hl+], a
    inc a
    dec bc
    ld a, b
    or c
    jr nz, .fillLoop

    ; Set Palettes (Normal, Inverted, High Contrast)
    ld a, %11100100 ; Normal
    ld [rBGP], a
    
    ld a, %10010001 ; LCD On, BG On
    ld [rLCDC], a

Done:
    halt
    jr Done
