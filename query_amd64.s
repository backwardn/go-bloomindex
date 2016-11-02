// Generated by PeachPy 0.2.0 from query.py


// func queryCore(r *uint64, bits *uint64, bits_len int64, bits_cap int64, hashes *uint16, hashes_len int64, hashes_cap int64)
TEXT ·queryCore(SB),4,$0-56
	MOVQ r+0(FP), AX
	MOVQ bits+8(FP), BX
	MOVQ hashes+32(FP), CX
	MOVQ hashes_len+40(FP), DX
	PCMPEQL X0, X0
	PCMPEQL X1, X1
	PCMPEQL X2, X2
	PCMPEQL X3, X3
loop_begin:
		MOVL 0(CX), DI
		SHLQ $6, DI
		ADDQ BX, DI
		PXOR X4, X4
		PAND 0(DI), X0
		PAND 16(DI), X1
		PAND 32(DI), X2
		PAND 48(DI), X3
		POR X0, X4
		POR X1, X4
		POR X2, X4
		POR X3, X4
		BYTE $0x66; BYTE $0x0F; BYTE $0x38; BYTE $0x17; BYTE $0xE4 // PTEST xmm4, xmm4
		JEQ loop_end
		ADDQ $4, CX
		SUBQ $1, DX
		JNE loop_begin
loop_end:
	MOVO X0, 0(AX)
	MOVO X1, 16(AX)
	MOVO X2, 32(AX)
	MOVO X3, 48(AX)
	RET
