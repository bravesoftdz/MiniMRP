unit UntConstant;

interface

Var
  AppPath: string;
  ClientAppVersion, ClientAppName: string;
  ClientUserName, ClientPassword, ClientIP: string;
  ClientPort, ClientUserID: integer;
  CurCompanyCode: string = '101';
  CurUserId: integer = 11;
  CallBackId: string;
  CallBackAllCount: integer =0;
  CallBackMeCount: integer =0;

const
  msgSaveCompleted = 'Save completed.';
  msgSaveFail = 'Fail to save.';
  msgBackupComplete = 'Backup file completed.';
  msgNotComplete = 'Check not completed.';
  msgDataNotFound = 'Data Not Found.';
  msgConfirmToDelete = 'Please Confirm To Delete';
  msgConfirmToCancel = 'Please Confirm To Cancel';
  msgDocumentNumber = 'Document Number';
  msgLoginFail = 'Login Fail, Try again';
  msgDataExisted = 'Data is now Existing';
  msgAlreadyCancel = 'This Record is Already Canceled';
  msgAlreadyReceive = 'This Serial is Already Received';
  msgItemsNotInStock = 'Item is Not in Stock';
  msgThisNotFIFO = 'This Record is NOT compattible with FIFO Rule';
  msgFileSizeTooLarge = 'File Size Too Large';
  msgPasswordNotMatch = 'Password Not Match Each Other.';
  msgInputCode = ' Please input Code';
  msgInputDescription = 'Please Input Description.';
  msgCannotCancel = 'Cannot Cancel This Record.';

implementation

end.
