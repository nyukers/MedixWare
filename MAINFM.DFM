�
 TMAINFORMFM 0�  TPF0TMainFormFm
MainFormFmLeftMTops
AutoScrollCaption"Xceed Zip Compression Library DemoClientHeight!ClientWidth�Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style MenuMainMnPositionpoScreenCenterOnCreate
FormCreatePixelsPerInch`
TextHeight TListBoxFilesLbLeft TopWidth�Height� AlignalClientBorderStylebsNoneCtl3D
ItemHeightMultiSelect	ParentCtl3DSorted	StylelbOwnerDrawFixedTabOrder 
OnDrawItemFilesLbDrawItemOnMeasureItemFilesLbMeasureItem  THeaderControlFilesHdLeft Top Width�HeightSections
AllowClickTextNameWidthd 
AllowClickTextDateWidth> 
AllowClickTextTimeWidthF 
AllowClickTextSizeWidthF 
AllowClickTextPackedWidthF 
AllowClickTextRatioWidth( 
AllowClickTextPathWidth�  OnSectionResizeFilesHdSectionResize  TPanelStatusPnLeft TopWidth�HeightAlignalBottomBorderWidthTabOrder TBevelBevel1LeftTopWidth)HeightAlignalClient  TLabelStatusLbLeftTopWidthHeightColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style ParentColor
ParentFont  TLabelHintLbLeftTopWidthHeightFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TPanelSpacePnLeft-TopWidthHeightAlignalRight
BevelOuterbvNoneTabOrder   TPanelPanel1Left1TopWidth� HeightAlignalRight	AlignmenttaLeftJustify
BevelOuter	bvLoweredBorderWidthCaptionPanel1TabOrder TProgressBarProgressBar1LeftTopWidth� HeightAlignalClientMin MaxdStepTabOrder    TPanelPanel2Left�TopWidthHeightAlignalRight
BevelOuterbvNoneTabOrder TSpeedButtonAbortSbLeftTop WidthHeightEnabled
Glyph.Data
J  F  BMF      v   (               �                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� �������������   �������������   �������������   �������������   �������������   �������������   �������������   �������������   �������������   �������������   �������������   �������������   �������������   	NumGlyphsOnClickAbortSbClick    	TMainMenuMainMnLeftTop  	TMenuItemFileMnCaption&FileOnClickFileMnClick 	TMenuItem	FileNewMnCaption&New Zipfile...HintCreate a new ZIP file.OnClickFileNewMnClick  	TMenuItem
FileOpenMnCaption&Open Zipfile...HintOpen an existing ZIP file.OnClickFileOpenMnClick  	TMenuItemFileCloseMnCaption&Close ZipfileHintClose current ZIP file.OnClickFileCloseMnClick  	TMenuItemN3Caption-  	TMenuItem
FileTestMnCaption&Test Zipfile...HintTest the selected ZIP file.OnClickFileTestMnClick  	TMenuItem	FileFixMnCaption&Fix Zipfile...HintFix a damaged ZIP file. 	TMenuItem
FixNormal1Caption&NormalHint'Fix a .Zip file with the normal option.OnClickFixNormal1Click  	TMenuItemFixAgressive1Caption
&AgressiveHint,Fix a .Zip file with the brute-force option.OnClickFixAgressive1Click   	TMenuItemFileDeleteMnCaption&Delete Zipfile...HintDelete the selected ZIP file.OnClickFileDeleteMnClick  	TMenuItemN1Caption-  	TMenuItem
FileExitMnCaptionE&xitHintExit program.OnClickFileExitMnClick   	TMenuItemEditMnCaption&EditOnClickEditMnClick 	TMenuItem	EditAddMnCaption&Add...HintAdd files to current ZIP file.OnClickEditAddMnClick  	TMenuItemEditDeleteMnCaption&DeleteHint,Delete selected files from current ZIP file.OnClickEditDeleteMnClick  	TMenuItemEditExtractMnCaption&Extract...Hint-Extract selected files from current ZIP file.OnClickEditExtractMnClick  	TMenuItemEditUpdateMnCaption
&Update...Hint.Update selected files in the current ZIP file.OnClickEditUpdateMnClick  	TMenuItemN4Caption-  	TMenuItemEditUpdateZIPDateMnCaption&Update ZIP DateHint-Update the file date of the current ZIP file.OnClickEditUpdateZIPDateMnClick  	TMenuItemN2Caption-  	TMenuItemEditSelectAllMnCaptionSelect &AllHint%Select all the files in the ZIP file.OnClickEditSelectAllMnClick   	TMenuItem	OptionsMnCaption&OptionsOnClickOptionsMnClick 	TMenuItemBestcompressionCaption&Best compression
GroupIndexHint)Use the best (slowest) compression level.	RadioItem	OnClickBestcompressionClick  	TMenuItemNormalcompressionCaption&Normal compression
GroupIndexHint!Use the normal compression level.	RadioItem	OnClickNormalcompressionClick  	TMenuItemFastestcompressionCaption&Fastest compression
GroupIndexHint"Use the fastest compression level.	RadioItem	OnClickFastestcompressionClick  	TMenuItemNoCompressionCaption&Store without compression
GroupIndexHint4Store files in the zip file without any compression.	RadioItem	OnClickNoCompressionClick  	TMenuItemN6Caption-
GroupIndex  	TMenuItemMultidiskmodeMnCaption&Multidisk mode
GroupIndexHint#Allow files to span multiple disks.OnClickMultidiskmodeMnClick  	TMenuItemClearDisksMnCaption&Clear disks
GroupIndexHint9Erase all data on each disk before writing zipfile to it.OnClickClearDisksMnClick  	TMenuItemN5Caption-
GroupIndex  	TMenuItemOptionsUseTempFileMnCaption&Use Temp File
GroupIndexHint Use a temporary file for safety.OnClickOptionsUseTempFileMnClick  	TMenuItemN7Caption-
GroupIndex  	TMenuItemSelfExtractingMnuCaptionSelf-E&xtracting
GroupIndexOnClickSelfExtractingMnuClick  	TMenuItemSelfextractorOptionsmnuCaptionSelf-Extractor &OptionsEnabled
GroupIndexOnClickSelfextractorOptionsmnuClick   	TMenuItemHelpMnCaption&Help 	TMenuItemHelpAboutMnCaption&About the XceedZip DemoHint%Show information about XceedZip Demo.OnClickHelpAboutMnClick    TOpenDialog
AddFilesDg
DefaultExt*.*FilterAll files (*.*)|*.*OptionsofHideReadOnlyofAllowMultiSelectofPathMustExistofFileMustExistofNoTestFileCreate Title	Add FilesLeftTop�   TSaveDialogNewZipDg
DefaultExtZIPFilter*Zip file (*.ZIP)|*.ZIP|All files (*.*)|*.*OptionsofOverwritePromptofHideReadOnlyofPathMustExistofCreatePrompt TitleNew ArchiveLeftTop`  TOpenDialog	OpenZipDg
DefaultExtZIPFilter*Zip file (*.ZIP)|*.ZIP|All files (*.*)|*.*OptionsofHideReadOnlyofPathMustExistofFileMustExist TitleOpen ArchiveLeftTop�   	TXceedZipMainXzCompressionStoredExtensions.ZIP;.LZH;.ARC;.ARJ;.ZOOOnAddingMainXzAdding
OnDeletingMainXzDeletingOnExtractingMainXzExtractingOnFixingMainXzFixingOnGlobalStatusMainXzGlobalStatus	OnListingMainXzListing	OnReplaceMainXzReplace	OnTestingMainXzTesting
OnUpdatingMainXzUpdatingOnSkippingFileMainXzSkippingFileOnStatusMainXzStatus	OnNewdiskMainXzNewdiskLeftTop@   