<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
exclude-result-prefixes="xs">
<xsl:import href="../dateTemplate.xsl"/>
<xsl:output method="xml" omit-xml-declaration="yes"/>
<xsl:variable name="lookupTable" select="document('esewa-mappingLookup.xml')"/>
<xsl:template match="/">
<xsl:variable name="convertedDate2">
            <xsl:call-template name="convertDateTime-to-YYYYMMDDHHMMSS">
                <xsl:with-param name="inputDateTime" select="root/IP/IP_Header/Request_Timestamp" />
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="SENDER_ID_ISSUE_DATE">
            <xsl:call-template name="extractDate-from-DateTime">
                <xsl:with-param name="inputDateTime" select="root/IP/Send_Remitance_Transaction_Request/Remitter/Identity_Issue_Date" />
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="SENDER_ID_EXPIRE_DATE">
            <xsl:call-template name="extractDate-from-DateTime">
                <xsl:with-param name="inputDateTime" select="root/IP/Send_Remitance_Transaction_Request/Remitter/Identity_Expiry_Date" />
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="SENDER_DATE_OF_BIRTH">
            <xsl:call-template name="extractDate-from-DateTime">
                <xsl:with-param name="inputDateTime" select="root/IP/Send_Remitance_Transaction_Request/Remitter/DOB" />
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="location_id" select="root/IP/Send_Remitance_Transaction_Request/Delivery_Type"/>
        <xsl:variable name="sender_id_type" select="root/IP/Send_Remitance_Transaction_Request/Remitter/Identity_Type"/>
        <xsl:variable name="source_of_fund" select="root/IP/Send_Remitance_Transaction_Request/Remitter/Source_of_Fund"/>
        <xsl:variable name="payment_mode" select="root/IP/Send_Remitance_Transaction_Request/Delivery_Type"/>
        <xsl:variable name="purpose_of_remittance" select="root/IP/Send_Remitance_Transaction_Request/Transaction/Transaction_Purpose"/>

        <xsl:variable name="AGENT_CODE" select="'AFEL01'"></xsl:variable>
        <xsl:variable name="USER_ID" select="'AFEL'"></xsl:variable>
        <xsl:variable name="AGENT_SESSION_ID" select="concat($convertedDate2,'-',root/IP/IP_Header/Partner_Code)" ></xsl:variable>
        <xsl:variable name="AGENT_TXNID" select="root/IP/Send_Remitance_Transaction_Request/Transaction/Transaction_No"></xsl:variable>
        <xsl:variable name="LOCATION_ID" select="$lookupTable/lookup/processTransaction/locationId/code[@value=$location_id]"></xsl:variable>
        <xsl:variable name="SENDER_FIRST_NAME" select="root/IP/Send_Remitance_Transaction_Request/Remitter/First_Name"></xsl:variable>
        <xsl:variable name="SENDER_MIDDLE_NAME" select="root/IP/Send_Remitance_Transaction_Request/Remitter/Second_Name"></xsl:variable>
        <xsl:variable name="SENDER_LAST_NAME" select="root/IP/Send_Remitance_Transaction_Request/Remitter/Last_Name"></xsl:variable>
        <xsl:variable name="SENDER_ADDRESS" select="root/IP/Send_Remitance_Transaction_Request/Remitter/Address1"></xsl:variable>
        <xsl:variable name="SENDER_CITY" select="root/IP/Send_Remitance_Transaction_Request/Remitter/City"></xsl:variable>
        <xsl:variable name="SENDER_COUNTRY" select="root/IP/Send_Remitance_Transaction_Request/Remitter/Nationality_Country_Id_ISO3"></xsl:variable>
        <xsl:variable name="SENDER_ID_TYPE" select="$lookupTable/lookup/processTransaction/senderIdType/code[@value=$sender_id_type]"></xsl:variable>
        <xsl:variable name="SENDER_ID_NUMBER" select="root/IP/Send_Remitance_Transaction_Request/Remitter/Identity_No"></xsl:variable>
        <xsl:variable name="SENDER_MOBILE" select="root/IP/Send_Remitance_Transaction_Request/Remitter/MobileNo"></xsl:variable>
        <xsl:variable name="SOURCE_OF_FUND" select="$lookupTable/lookup/processTransaction/fundSourceType/code[@value=$source_of_fund]"></xsl:variable>
        <xsl:variable name="SENDER_OCCUPATION" select="root/IP/Send_Remitance_Transaction_Request/Remitter/Occupation"></xsl:variable>
        <xsl:variable name="SENDER_NATIONALITY" select="root/IP/Send_Remitance_Transaction_Request/Remitter/Nationality_Country_Id_ISO3"></xsl:variable>
        <xsl:variable name="RECEIVER_FIRST_NAME" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/First_Name"></xsl:variable>
        <xsl:variable name="RECEIVER_MIDDLE_NAME" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Second_Name"></xsl:variable>
        <xsl:variable name="RECEIVER_LAST_NAME" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Last_Name"></xsl:variable>
        <xsl:variable name="RECEIVER_ADDRESS" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Address1"></xsl:variable>
        <xsl:variable name="RECEIVER_CITY" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/City"></xsl:variable>
        <xsl:variable name="RECEIVER_COUNTRY" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Nationality_Country_Id_ISO3"></xsl:variable>
        <xsl:variable name="RECEIVER_CONTACT_NUMBER" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Mobile"></xsl:variable>
        <xsl:variable name="RELATIONSHIP_TO_BENEFICIARY" select="'23'"></xsl:variable>
        <xsl:variable name="PAYMENT_MODE" select="$lookupTable/lookup/processTransaction/disbursalType/code[@value=$payment_mode]"></xsl:variable>
        <xsl:variable name="BANK_ID" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary_Bank/Code"></xsl:variable>
        <xsl:variable name="BANK_NAME" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary_Bank/Name"></xsl:variable>
        <xsl:variable name="BANK_BRANCH_NAME" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary_Bank/Branch/Br_Name"></xsl:variable>
        <xsl:variable name="BANK_ACCOUNT_NUMBER" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Account_No"></xsl:variable>
        <xsl:variable name="WALLET_ID" select="''"></xsl:variable>
        <xsl:variable name="CALC_BY" select="'P'"></xsl:variable>
        <xsl:variable name="TRANSFER_AMOUNT" select="root/IP/Send_Remitance_Transaction_Request/Amount_Paid"></xsl:variable>
        <xsl:variable name="OURSERVICE_CHARGE" select="''"></xsl:variable>
        <xsl:variable name="TRANSACTION_EXCHANGERATE" select="''"></xsl:variable>
        <xsl:variable name="SETTLEMENT_DOLLARRATE" select="''"></xsl:variable>
        <xsl:variable name="PURPOSE_OF_REMITTANCE" select="$lookupTable/lookup/processTransaction/purposeCode/code[@value=$purpose_of_remittance]"></xsl:variable>
        <xsl:variable name="ADDITIONAL_FIELD1" select="''"></xsl:variable>
        <xsl:variable name="ADDITIONAL_FIELD2" select="''"></xsl:variable>
        <xsl:variable name="AUTHORIZED_REQUIRED" select="'N'"></xsl:variable>
        <xsl:variable name="PASSWORD" select="'yp4eunz1a8'"></xsl:variable>

        <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:cli="ClientWebService">
        <soap:Header/>
            <soap:Body>
                <SendTransaction xmlns="ClientWebService">
                    <AGENT_CODE>
                        <xsl:value-of select="$AGENT_CODE"/>
                    </AGENT_CODE>
                    <USER_ID>
                        <xsl:value-of select="$USER_ID"/>
                    </USER_ID>
                    <AGENT_SESSION_ID>
                        <xsl:value-of select="$AGENT_SESSION_ID" />
                    </AGENT_SESSION_ID>
                    <AGENT_TXNID>
                        <xsl:value-of select="$AGENT_TXNID"/>
                    </AGENT_TXNID>
                    <LOCATION_ID>
                        <xsl:value-of select="$LOCATION_ID"/>
                    </LOCATION_ID>
                    <SENDER_FIRST_NAME>
                        <xsl:value-of select="$SENDER_FIRST_NAME"/>
                    </SENDER_FIRST_NAME>
                    <SENDER_MIDDLE_NAME>
                        <xsl:value-of select="$SENDER_MIDDLE_NAME"/>
                    </SENDER_MIDDLE_NAME>
                    <SENDER_LAST_NAME>
                        <xsl:value-of select="$SENDER_LAST_NAME"/>
                    </SENDER_LAST_NAME>
                    <SENDER_ADDRESS>
                        <xsl:value-of select="$SENDER_ADDRESS"/>
                    </SENDER_ADDRESS>
                    <SENDER_CITY>
                        <xsl:value-of select="$SENDER_CITY"/>
                    </SENDER_CITY>
                    <SENDER_COUNTRY>
                        <xsl:value-of select="$SENDER_COUNTRY"/>
                    </SENDER_COUNTRY>
                    <SENDER_ID_TYPE>
                        <xsl:value-of select="$SENDER_ID_TYPE"/>
                    </SENDER_ID_TYPE>
                    <SENDER_ID_NUMBER>
                        <xsl:value-of select="$SENDER_ID_NUMBER"/>
                    </SENDER_ID_NUMBER>
                    <SENDER_ID_ISSUE_DATE>
                        <xsl:value-of select="$SENDER_ID_ISSUE_DATE"/>
                    </SENDER_ID_ISSUE_DATE>
                    <SENDER_ID_EXPIRE_DATE>
                        <xsl:value-of select="$SENDER_ID_EXPIRE_DATE"/>
                    </SENDER_ID_EXPIRE_DATE>
                    <SENDER_DATE_OF_BIRTH>
                        <xsl:value-of select="$SENDER_DATE_OF_BIRTH"/>
                    </SENDER_DATE_OF_BIRTH>
                    <SENDER_MOBILE>
                        <xsl:value-of select="$SENDER_MOBILE"/>
                    </SENDER_MOBILE>
                    <SOURCE_OF_FUND>
                        <xsl:value-of select="$SOURCE_OF_FUND"/>
                    </SOURCE_OF_FUND>
                    <SENDER_OCCUPATION>
                        <xsl:value-of select="$SENDER_OCCUPATION"/>
                    </SENDER_OCCUPATION>
                    <SENDER_NATIONALITY>
                        <xsl:value-of select="$SENDER_NATIONALITY"/>
                    </SENDER_NATIONALITY>
                    <RECEIVER_FIRST_NAME>
                        <xsl:value-of select="$RECEIVER_FIRST_NAME"/>
                    </RECEIVER_FIRST_NAME>
                    <RECEIVER_MIDDLE_NAME>
                        <xsl:value-of select="$RECEIVER_MIDDLE_NAME"/>
                    </RECEIVER_MIDDLE_NAME>
                    <RECEIVER_LAST_NAME>
                        <xsl:value-of select="$RECEIVER_LAST_NAME"/>
                    </RECEIVER_LAST_NAME>
                    <RECEIVER_ADDRESS>
                        <xsl:value-of select="$RECEIVER_ADDRESS"/>
                    </RECEIVER_ADDRESS>
                    <RECEIVER_CITY>
                        <xsl:value-of select="$RECEIVER_CITY"/>
                    </RECEIVER_CITY>
                    <RECEIVER_COUNTRY>
                        <xsl:value-of select="$RECEIVER_COUNTRY"/>
                    </RECEIVER_COUNTRY>
                    <RECEIVER_CONTACT_NUMBER>
                        <xsl:value-of select="$RECEIVER_CONTACT_NUMBER"/>
                    </RECEIVER_CONTACT_NUMBER>
                    <RELATIONSHIP_TO_BENEFICIARY>
                        <xsl:value-of select="$RELATIONSHIP_TO_BENEFICIARY"/>
                    </RELATIONSHIP_TO_BENEFICIARY>
                    <PAYMENT_MODE>
                        <xsl:value-of select="$PAYMENT_MODE"/>
                    </PAYMENT_MODE>
                    <BANK_ID>
                        <xsl:value-of select="$BANK_ID"/>
                    </BANK_ID>
                    <BANK_NAME>
                        <xsl:value-of select="$BANK_NAME"/>
                    </BANK_NAME>
                    <BANK_BRANCH_NAME>
                        <xsl:value-of select="$BANK_BRANCH_NAME"/>
                    </BANK_BRANCH_NAME>
                    <BANK_ACCOUNT_NUMBER>
                        <xsl:value-of select="$BANK_ACCOUNT_NUMBER"/>
                    </BANK_ACCOUNT_NUMBER>
                    <WALLET_ID>
                        <xsl:value-of select="$WALLET_ID"/>
                    </WALLET_ID>
                    <CALC_BY>
                        <xsl:value-of select="$CALC_BY"/>
                    </CALC_BY>
                    <TRANSFER_AMOUNT>
                        <xsl:value-of select="$TRANSFER_AMOUNT"/>
                    </TRANSFER_AMOUNT>
                    <OURSERVICE_CHARGE>
                        <xsl:value-of select="$OURSERVICE_CHARGE"/>
                    </OURSERVICE_CHARGE>
                    <TRANSACTION_EXCHANGERATE>
                        <xsl:value-of select="$TRANSACTION_EXCHANGERATE"/>
                    </TRANSACTION_EXCHANGERATE>
                    <SETTLEMENT_DOLLARRATE>
                        <xsl:value-of select="$SETTLEMENT_DOLLARRATE"/>
                    </SETTLEMENT_DOLLARRATE>
                    <PURPOSE_OF_REMITTANCE>
                        <xsl:value-of select="$PURPOSE_OF_REMITTANCE"/>
                    </PURPOSE_OF_REMITTANCE>
                    <ADDITIONAL_FIELD1>
                        <xsl:value-of select="$ADDITIONAL_FIELD1"/>
                    </ADDITIONAL_FIELD1>
                    <ADDITIONAL_FIELD2>
                        <xsl:value-of select="$ADDITIONAL_FIELD2"/>
                    </ADDITIONAL_FIELD2>
                    <AUTHORIZED_REQUIRED>
                        <xsl:value-of select="$AUTHORIZED_REQUIRED"/>
                    </AUTHORIZED_REQUIRED>
                    <SIGNATURE>GHS[/'
                        <xsl:value-of select="concat($AGENT_CODE,$USER_ID,$AGENT_SESSION_ID,$AGENT_TXNID,$LOCATION_ID,$SENDER_FIRST_NAME,$SENDER_MIDDLE_NAME,$SENDER_LAST_NAME,$SENDER_ADDRESS,$SENDER_CITY,$SENDER_COUNTRY,$SENDER_ID_TYPE,$SENDER_ID_NUMBER,$SENDER_ID_ISSUE_DATE,$SENDER_ID_EXPIRE_DATE,$SENDER_DATE_OF_BIRTH,$SENDER_MOBILE,$SOURCE_OF_FUND,$SENDER_OCCUPATION,$SENDER_NATIONALITY,$RECEIVER_FIRST_NAME,$RECEIVER_MIDDLE_NAME,$RECEIVER_LAST_NAME,$RECEIVER_ADDRESS,$RECEIVER_CITY,$RECEIVER_COUNTRY,$RECEIVER_CONTACT_NUMBER,$RELATIONSHIP_TO_BENEFICIARY,$PAYMENT_MODE,$BANK_ID,$BANK_NAME,$BANK_BRANCH_NAME,$BANK_ACCOUNT_NUMBER,$WALLET_ID,$CALC_BY,$TRANSFER_AMOUNT,$OURSERVICE_CHARGE,$TRANSACTION_EXCHANGERATE,$SETTLEMENT_DOLLARRATE,$PURPOSE_OF_REMITTANCE,$ADDITIONAL_FIELD1,$ADDITIONAL_FIELD2,$AUTHORIZED_REQUIRED, $PASSWORD)"/>/',/'SHA-256/',/'UTF-8/']
                    </SIGNATURE>
                </SendTransaction>
        </soap:Body>
        </soap:Envelope>
	</xsl:template>
</xsl:stylesheet>