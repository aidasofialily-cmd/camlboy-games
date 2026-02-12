; hardware.inc - Minimal register mapping for Camlboy
DEF rLCDC EQU $FF40 ; LCD Control
DEF rSTAT EQU $FF41 ; LCD Status
DEF rSCY  EQU $FF42 ; Scroll Y
DEF rSCX  EQU $FF43 ; Scroll X
DEF rLY   EQU $FF44 ; LCDC Y-Coordinate (Read-only)
DEF rBGP  EQU $FF47 ; BG Palette Data
DEF rIE   EQU $FFFF ; Interrupt Enable
