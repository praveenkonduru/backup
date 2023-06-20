@ECHO OFF
:Operation
ECHO *************************************************************
ECHO *************************************************************
ECHO Select Operation
ECHO 1. Start DIT OCTS Services
ECHO 2. Stop DIT OCTS Services
ECHO 3. Start QAT OCTS Services
ECHO 4. Stop QAT OCTS Services
ECHO 5. Start PROD OCTS Services
ECHO 6. Stop PROD OCTS Services
ECHO 7. Exit
SET /P _operation= Please provide Operation choice 1-7:

IF "%_operation%"=="1" GOTO :Start_DIT_Services
IF "%_operation%"=="2" GOTO :Stop_DIT_Services
IF "%_operation%"=="3" GOTO :Start_QAT_Services
IF "%_operation%"=="4" GOTO :Stop_QAT_Services
IF "%_operation%"=="5" GOTO :Start_PROD_Services
IF "%_operation%"=="6" GOTO :Stop_PROD_Services
IF "%_operation%"=="7" GOTO :END

:Start_DIT_Services
ECHO *************************************************************
ECHO *************************************************************
rem sc \\C03DFOEINV93.dslab.ad.adp.com Start CDK.OCTS.InventoryOwnerQueueListener
rem sc \\C03DFOEINV25.dslab.ad.adp.com Start CDK.OCTS.InventoryOwnerQueueListener
sc \\C03DFOEINV93.dslab.ad.adp.com Start CDK.OCTS.EnterpriseCompanyQueueListener
sc \\C03DFOEINV25.dslab.ad.adp.com Start CDK.OCTS.EnterpriseCompanyQueueListener
ECHO DIT Services Started
GOTO :CONTINUE

:Stop_DIT_Services
ECHO *************************************************************
ECHO *************************************************************
rem sc \\C03DFOEINV93.dslab.ad.adp.com Stop CDK.OCTS.InventoryOwnerQueueListener
rem sc \\C03DFOEINV25.dslab.ad.adp.com Stop CDK.OCTS.InventoryOwnerQueueListener
sc \\C03DFOEINV93.dslab.ad.adp.com Stop CDK.OCTS.EnterpriseCompanyQueueListener
sc \\C03DFOEINV25.dslab.ad.adp.com Stop CDK.OCTS.EnterpriseCompanyQueueListener
ECHO DIT Services Stopped
GOTO :CONTINUE

rem :QAT

:Start_QAT_Services
ECHO *************************************************************
ECHO *************************************************************
rem :sc \\C03QFOEINV32.dslab.ad.adp.com Start CDK.OCTS.InventoryOwnerQueueListener
rem :sc \\C03QFOEINV41.dslab.ad.adp.com Start CDK.OCTS.InventoryOwnerQueueListener
sc \\C03QFOEINV32.dslab.ad.adp.com Start CDK.OCTS.EnterpriseCompanyQueueListener
sc \\C03QFOEINV41.dslab.ad.adp.com Start CDK.OCTS.EnterpriseCompanyQueueListener
ECHO QAT Services Started
GOTO :CONTINUE

:Stop_QAT_Services
ECHO *************************************************************
ECHO *************************************************************
rem sc \\C03QFOEINV32.dslab.ad.adp.com Stop CDK.OCTS.InventoryOwnerQueueListener
rem sc \\C03QFOEINV41.dslab.ad.adp.com Stop CDK.OCTS.InventoryOwnerQueueListener
sc \\C03QFOEINV32.dslab.ad.adp.com Stop CDK.OCTS.EnterpriseCompanyQueueListener
sc \\C03QFOEINV41.dslab.ad.adp.com Stop CDK.OCTS.EnterpriseCompanyQueueListener
ECHO QAT Services Stopped
GOTO :CONTINUE
REM PROD***********************************
:Start_PROD_Services
ECHO *************************************************************
ECHO *************************************************************
rem :sc \\C03QFOEINV32.dslab.ad.adp.com Start CDK.OCTS.InventoryOwnerQueueListener
rem :sc \\C03QFOEINV41.dslab.ad.adp.com Start CDK.OCTS.InventoryOwnerQueueListener
sc \\c04pfoeinvisa40.dswh.ds.adp.com Start CDK.OCTS.EnterpriseCompanyQueueListener
sc \\c04pfoeinvisa48.dswh.ds.adp.com Start CDK.OCTS.EnterpriseCompanyQueueListener
ECHO PROD Services Started
GOTO :CONTINUE

:Stop_PROD_Services
ECHO *************************************************************
ECHO *************************************************************
sc \\c04pfoeinvisa40.dswh.ds.adp.com Stop CDK.OCTS.EnterpriseCompanyQueueListener
sc \\c04pfoeinvisa48.dswh.ds.adp.com Stop CDK.OCTS.EnterpriseCompanyQueueListener
ECHO PROD Services Stopped
GOTO :CONTINUE

sc create CDK.OCTS.EnterpriseCompanyQueueListener binpath= "D:\OCTS\MerchandisingService\bin\CDK.OneClickToStock.MerchEventConsumer.exe" displayname= "CDK.OCTS.EnterpriseCompanyQueueListener"

sc create CDK.OCTS.InventoryOwnerQueueListener binpath= "D:\OCTS\NonMerchandiseService\bin\CDK.OneClickToStock.NonMerchEventConsumer.exe" displayname= "CDK.OCTS.InventoryOwnerQueueListener"

:CONTINUE
SET /P _operation= TO CONTINUE CHOOSE ONE OPTION 1-7:
IF "%_operation%"=="1" GOTO :Start_DIT_Services
IF "%_operation%"=="2" GOTO :Stop_DIT_Services
IF "%_operation%"=="3" GOTO :Start_QAT_Services
IF "%_operation%"=="4" GOTO :Stop_QAT_Services
IF "%_operation%"=="5" GOTO :Start_PROD_Services
IF "%_operation%"=="6" GOTO :Stop_PROD_Services
IF "%_operation%"=="7" GOTO :END

:END
exit

rem pause