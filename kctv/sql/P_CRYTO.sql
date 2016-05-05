PACKAGE P_CRYTO
IS
	-- 암호화
	FUNCTION ENC (
		input_string	IN VARCHAR2
	) RETURN RAW;
	FUNCTION DEC (
		input_string	IN VARCHAR2
	) RETURN VARCHAR2 DETERMINISTIC;
	FUNCTION ENC_MD5 (
		input_string	IN VARCHAR2
	) RETURN VARCHAR2;
END P_CRYTO;

PACKAGE BODY P_CRYTO
IS
	SQLERRMSG	VARCHAR2(255);
	SQLERRCDE	NUMBER;
	v_sqle		VARCHAR2(64);
	key_data	VARCHAR2(16);

	/*
		1.DBMS_CRYPTO Cryptographic Hash Functions
			HASH_MD4 Produces a 128-bit hash, or message digest of the input message
			HASH_MD5 Also produces a 128-bit hash, but is more complex than MD4
			HASH_SH1 Secure Hash Algorithm (SHA). Produces a 160-bit hash.
		2. DBMS_CRYPTO MAC (Message Authentication Code) Functions
			HASH_MD4 Produces a 128-bit hash, or message digest of the input message
			HASH_MD5 Also produces a 128-bit hash, but is more complex than MD4
			HASH_SH1 Secure Hash Algorithm (SHA). Produces a 160-bit hash.
		3. DBMS_CRYPTO Encryption Algorithms
			ENCRYPT_DES Data Encryption Standard. Block cipher. Uses key length of 56 bits.
			ENCRYPT_3DES_2KEY Data Encryption Standard. Block cipher. Operates on a block 3 times with 2 keys. Effective key length of 112 bits.
			ENCRYPT_3DES Data Encryption Standard. Block cipher. Operates on a block 3 times.
			ENCRYPT_AES128 Advanced Encryption Standard. Block cipher. Uses 128-bit key size.
			ENCRYPT_AES192 Advanced Encryption Standard. Block cipher. Uses 192-bit key size.
			ENCRYPT_AES256 Advanced Encryption Standard. Block cipher. Uses 256-bit key size.
			ENCRYPT_RC4 Stream cipher. Uses a secret, randomly generated key unique to each session.
		4. DBMS_CRYPTO DBMS_CRYPTO Block Cipher Suites
			DES_CBC_PKCS5 ENCRYPT_DESFoot 1 + CHAIN_CBCFoot 2 + PAD_PKCS5Foot 3
			DES3_CBC_PKCS5 ENCRYPT_3DESFootref 1 + CHAIN_CBCFootref 2 + PAD_PKCS5Footref 3'
		5. DBMS_CRYPTO Block Cipher Padding Modifiers
			PAD_PKCS5 Provides padding which complies with the PKCS #5: Password-Based Cryptography Standard
			PAD_NONE Provides option to specify no padding. Caller must ensure that blocksize is correct, else the package returns an error.
			PAD_ZERO Provides padding consisting of zeroes.
		6. DBMS_CRYPTO Exceptions
			CipherSuiteInvalid 28827 The specified cipher suite is not defined.
			CipherSuiteNull 28829 No value has been specified for the cipher suite to be used.
			KeyNull 28239 The encryption key has not been specified or contains a NULL value.
			KeyBadSize 28234 DES keys: Specified key size is too short. DES keys must be at least 8 bytes (64 bits).
			AES keys: Specified key size is not supported. AES keys must be 128, 192, or 256 bits in length.
			DoubleEncryption 28233 Source data was previously encrypted.
	*/

	-- 암호화 알고리즘 선택
	ENCRYPTION_TYPE PLS_INTEGER := -- total encryption type
		DBMS_CRYPTO.ENCRYPT_AES128
		+ DBMS_CRYPTO.CHAIN_CBC
		+ DBMS_CRYPTO.PAD_PKCS5;
	
	-- 암호화
	FUNCTION ENC (input_string IN VARCHAR2 )
		RETURN RAW
	IS
		key_data_raw	RAW(64);
		converted_raw	RAW(64);
		encrypted_raw	RAW(64);
	BEGIN
		key_data := '#qwertyuiopasdf#';
		converted_raw := UTL_I18N.STRING_TO_RAW(input_string, 'AL32UTF8');
		key_data_raw:= UTL_I18N.STRING_TO_RAW(key_data, 'AL32UTF8');
		encrypted_raw :=
			DBMS_CRYPTO.ENCRYPT(
				src => converted_raw ,
				typ => ENCRYPTION_TYPE,
				key => key_data_raw ,
				iv => NULL);
		RETURN encrypted_raw;
	END ENC;

	-- 복호화
	FUNCTION DEC (input_string IN VARCHAR2 )
		RETURN VARCHAR2 DETERMINISTIC
	IS
		converted_string	VARCHAR2(64);
		key_data_raw		RAW(64);
		decrypted_raw	VARCHAR2(64);
	BEGIN
		--key_data := 'dkaghdhkwjrdyd12';
		key_data := '#qwertyuiopasdf#';
		key_data_raw:= UTL_I18N.STRING_TO_RAW(key_data, 'AL32UTF8');
		decrypted_raw :=
		DBMS_CRYPTO.DECRYPT(
			src => input_string ,
			typ => ENCRYPTION_TYPE ,
			key => key_data_raw ,
			iv => NULL);
		converted_string := UTL_I18N.RAW_TO_CHAR(decrypted_raw, 'AL32UTF8');
		RETURN converted_string;
	END DEC ;

	-- MD5 단방향 암호 (비밀번호 암호화)
	FUNCTION ENC_MD5 (input_string IN VARCHAR2)
		RETURN VARCHAR2
	IS
		converted_string	VARCHAR2(32);
	BEGIN
		converted_string := RAWTOHEX(DBMS_CRYPTO.Hash(TO_CLOB(to_char(input_string)),DBMS_CRYPTO.HASH_MD5));
		RETURN converted_string;
	END ENC_MD5 ;

END P_CRYTO;