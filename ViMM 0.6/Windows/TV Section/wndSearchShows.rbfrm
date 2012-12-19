#tag WindowBegin Window wndSearchShows   BackColor       =   &hFFFFFF   Backdrop        =   ""   CloseButton     =   True   Composite       =   False   Frame           =   1   FullScreen      =   False   HasBackColor    =   False   Height          =   500   ImplicitInstance=   True   LiveResize      =   False   MacProcID       =   0   MaxHeight       =   32000   MaximizeButton  =   False   MaxWidth        =   32000   MenuBar         =   ""   MenuBarVisible  =   True   MinHeight       =   64   MinimizeButton  =   False   MinWidth        =   64   Placement       =   3   Resizeable      =   False   Title           =   "Search [NAME]"   Visible         =   True   Width           =   900   Begin ccSearch ccSearchShows      AcceptFocus     =   ""      AcceptTabs      =   True      AutoDeactivate  =   True      BackColor       =   16777215      Backdrop        =   ""      Enabled         =   True      EraseBackground =   True      HasBackColor    =   False      Height          =   33      HelpTag         =   ""      InitialParent   =   ""      Left            =   0      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   True      LockRight       =   ""      LockTop         =   True      Scope           =   0      TabIndex        =   0      TabPanelIndex   =   0      TabStop         =   True      Top             =   0      UseFocusRing    =   False      Visible         =   True      Width           =   300   End   Begin ccCancelSave CancelSave      AcceptFocus     =   ""      AcceptTabs      =   True      AutoDeactivate  =   True      BackColor       =   &hFFFFFF      Backdrop        =   ""      Enabled         =   True      EraseBackground =   True      HasBackColor    =   False      Height          =   22      HelpTag         =   ""      InitialParent   =   ""      Left            =   680      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   True      LockRight       =   ""      LockTop         =   True      Scope           =   0      TabIndex        =   1      TabPanelIndex   =   0      TabStop         =   True      Top             =   458      UseFocusRing    =   ""      Visible         =   True      Width           =   200   End   Begin ListboxPRO lstResults      AlternatingRows =   True      AutoDeactivate  =   True      AutoHideScrollbars=   True      Bold            =   ""      Border          =   True      ColumnCount     =   15      ColumnsResizable=   ""      ColumnWidths    =   "100%, 0"      DataField       =   ""      DataSource      =   ""      DefaultRowHeight=   22      Enabled         =   True      EnableDrag      =   ""      EnableDragReorder=   ""      GridLinesHorizontal=   0      GridLinesVertical=   0      HasHeading      =   ""      HeadingIndex    =   -1      Height          =   413      HelpTag         =   ""      Hierarchical    =   ""      Index           =   -2147483648      InitialParent   =   ""      InitialValue    =   ""      Italic          =   ""      Left            =   0      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   True      LockRight       =   ""      LockTop         =   True      RequiresSelection=   True      Scope           =   0      ScrollbarHorizontal=   ""      ScrollBarVertical=   True      SelectionGradient=   True      SelectionType   =   0      SourceList      =   False      TabIndex        =   2      TabPanelIndex   =   0      TabStop         =   True      TextFont        =   "System"      TextSize        =   12      TextUnit        =   0      Top             =   33      TypeToSearch    =   True      Underline       =   ""      UseFocusRing    =   True      Visible         =   True      Width           =   300      _ScrollWidth    =   -1   End   Begin Canvas cvsInfo      AcceptFocus     =   ""      AcceptTabs      =   ""      AutoDeactivate  =   True      Backdrop        =   ""      DoubleBuffer    =   False      Enabled         =   True      EraseBackground =   True      Height          =   446      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   300      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   True      LockRight       =   ""      LockTop         =   True      Scope           =   0      TabIndex        =   3      TabPanelIndex   =   0      TabStop         =   True      Top             =   0      UseFocusRing    =   True      Visible         =   True      Width           =   600   End   Begin Thread ThrSearchResult      Height          =   32      Index           =   -2147483648      Left            =   64      LockedInPosition=   False      Priority        =   5      Scope           =   0      StackSize       =   0      TabPanelIndex   =   0      Top             =   513      Width           =   32   End   Begin HTTPSocket Sckt      Address         =   ""      Height          =   32      Index           =   -2147483648      Left            =   20      LockedInPosition=   False      Port            =   0      Scope           =   0      TabPanelIndex   =   0      Top             =   513      Width           =   32      yield           =   0   End   Begin ProgressBar prgBar      AutoDeactivate  =   True      Enabled         =   True      Height          =   22      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   20      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   True      LockRight       =   ""      LockTop         =   True      Maximum         =   0      Scope           =   0      TabPanelIndex   =   0      Top             =   458      Value           =   0      Visible         =   False      Width           =   260   End   Begin PopupArrow popWeb      AutoDeactivate  =   True      Enabled         =   True      Facing          =   1      Height          =   10      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   658      LockBottom      =   True      LockedInPosition=   False      LockLeft        =   False      LockRight       =   True      LockTop         =   False      Scope           =   0      TabIndex        =   4      TabPanelIndex   =   0      TabStop         =   True      Top             =   464      Visible         =   True      Width           =   10   EndEnd#tag EndWindow#tag WindowCode	#tag Event		Sub Close()		  		  ThrSearchResult.Kill		  Sckt.Close		End Sub	#tag EndEvent	#tag Event		Sub Open()		  Select Case wndMain.ppMain.Value		    		  Case 0		    Self.Title = wTitleSearchMovie		  Case 1		    Self.Title = wTitleSearchShow		  Case 2		    Self.Title = wTitleSearchAnime		    		  End Select		End Sub	#tag EndEvent	#tag MenuHandler		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action			Close			Return True					End Function	#tag EndMenuHandler	#tag Constant, Name = kSearchFieldHelpText, Type = String, Dynamic = True, Default = \"Movie title (year) or IMDb ID", Scope = Protected		#Tag Instance, Platform = Any, Language = en, Definition  = \"Movie title (year) or IMDb ID"		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Film titel (jaar) of IMDb ID"		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Filmtitel (\xC3\xA5r) eller IMDb ID"		#Tag Instance, Platform = Any, Language = de, Definition  = \"Film Titel (Jahr) oder IMDb ID"	#tag EndConstant	#tag Constant, Name = kUseIMDBID, Type = String, Dynamic = True, Default = \"Instead of key words\x2C you can also use an IMDb ID to search for a movie.", Scope = Protected		#Tag Instance, Platform = Any, Language = en, Definition  = \"Instead of key words\x2C you can also use an IMDb ID to search for a movie."		#Tag Instance, Platform = Any, Language = nl, Definition  = \"In plaats van sleutelwoorden\x2C kunt u ook een IMDb ID gebruiken om te zoeken naar een film."		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Inst\xC3\xA4llet f\xC3\xB6r nyckelord kan du anv\xC3\xA4nda IMDb ID f\xC3\xB6r att s\xC3\xB6ka efter en film."		#Tag Instance, Platform = Any, Language = de, Definition  = \"Anstelle von Suchbegriffen kann auch  eine IMDb ID dazu genutzt werden um nach einem Film zu suchen."	#tag EndConstant	#tag Constant, Name = wTitleSearchAnime, Type = String, Dynamic = True, Default = \"Search Anime", Scope = Protected		#Tag Instance, Platform = Any, Language = en, Definition  = \"Search Anime"		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Zoek Anime"	#tag EndConstant	#tag Constant, Name = wTitleSearchMovie, Type = String, Dynamic = True, Default = \"Search Movies", Scope = Protected		#Tag Instance, Platform = Any, Language = en, Definition  = \"Search Movies"		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Zoek Films"		#Tag Instance, Platform = Any, Language = sv, Definition  = \"S\xC3\xB6k filmer"		#Tag Instance, Platform = Any, Language = de, Definition  = \"Film suchen"	#tag EndConstant	#tag Constant, Name = wTitleSearchShow, Type = String, Dynamic = True, Default = \"Search TV Shows", Scope = Protected		#Tag Instance, Platform = Any, Language = en, Definition  = \"Search Shows"		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Zoek Series"	#tag EndConstant#tag EndWindowCode#tag Events ccSearchShows	#tag Event		Function KeyDown(Key As String) As Boolean		  If Asc(Key) = 13 Then Return True		End Function	#tag EndEvent	#tag Event		Sub Open()		  Me.edtSearch.CueText = kSearchFieldHelpText		End Sub	#tag EndEvent	#tag Event		Sub ResetSearch()		  Me.edtSearch.Text = ""		End Sub	#tag EndEvent	#tag Event		Sub DoSearch(SearchText as String)		  If Trim(SearchText) = "" Then Return		  		  		  If SearchText.Left(2) = "tt" Or SearchText.Left(2) = "id:" Then		    Self.Close		    If wndMain.ppMain.Value = 0 Then dlgProgress.ScrapeMovie( SearchText.ReplaceAll("id:",""), lstResults.Cell( lstResults.ListIndex, 0 ) )		  Else		    If wndMain.ppMain.Value = 0 Then dlgProgress.Start( Loc.kSearching + ":", SearchText, 0, "ManualSearchMovie" )		    If wndMain.ppMain.Value = 1 Then dlgProgress.Start( Loc.kSearching + ":", SearchText, 0, "ManualSearchShow" )		  End If		End Sub	#tag EndEvent#tag EndEvents#tag Events CancelSave	#tag Event		Sub ActionCancel()		  dlgProgress.Close		  Close		End Sub	#tag EndEvent	#tag Event		Sub ActionOK()		  Dim ID   as String = lstResults.Cell( lstResults.ListIndex, 1 )		  Dim Name as String = lstResults.Cell( lstResults.ListIndex, 0 )		  dlgProgress.Close		  Close		  		  Dim FolderParent as FolderItem		  If wndMain.ppMain.Value = 0 Then FolderParent = MovieAttr.FolderParent		  If wndMain.ppMain.Value = 1 Then FolderParent =    TVAttr.FolderParent		  		  If PriorArtFound( FolderParent ) Then		    		    If Prefs.integerForKey("KeepImages") = 0 Then // Ask First		      If MsgDlg( Nil, 1, MovieCore.msgPriorMovieArtFound.ReplaceAll( "<movie>", CurrentItemName ), MovieCore.msgPriorArtDeletion, MovieCore.btnReplaceExistingArtwork, MovieCore.btnDownloadMissingArtwork ) = 1 Then PriorArtDelete( MovieAttr.FolderParent )		    ElseIf Prefs.integerForKey("KeepImages") = 1 Then // Always		      PriorArtDelete( FolderParent )		    End If		    		  End If		  		  If wndMain.ppMain.Value = 0 Then dlgProgress.ScrapeMovie( ID, Name )		  If wndMain.ppMain.Value = 1 Then MessageBox ID + " - " + Name		End Sub	#tag EndEvent	#tag Event		Sub Open()		  me.btnRight.Default = False		End Sub	#tag EndEvent#tag EndEvents#tag Events lstResults	#tag Event		Sub DoubleClick()		  If Me.ListIndex > -1 Then CancelSave.btnRight.Push		End Sub	#tag EndEvent	#tag Event		Function KeyDown(Key As String) As Boolean		  If Keyboard.AsyncKeyDown( &h4C ) or Keyboard.AsyncKeyDown( &h24 ) then // Pressed Enter		    If Me.ListIndex > -1 then CancelSave.btnRight.Push		  ElseIf Keyboard.AsyncKeyDown( &h35 ) then // Pressed Escape		    CancelSave.btnLeft.Push		  End If		End Function	#tag EndEvent#tag EndEvents#tag Events cvsInfo	#tag Event		Sub Paint(g As Graphics)		  g.ForeColor = &cFFFFFF		  g.FillRect 0, 0, me.Width, me.Height		  		  		  		  		  		  		  // ## Borders		  g.ForeColor = &cC3C3C3		  g.DrawLine 0, 0, me.Width, 0		  g.DrawLine 0, me.Height - 1, me.Width, me.Height - 1		End Sub	#tag EndEvent#tag EndEvents#tag Events Sckt	#tag Event		Sub Error(code as integer)		  SocketError( code, Me )		  		Exception err as NilObjectException		  Me.Close		End Sub	#tag EndEvent#tag EndEvents#tag Events popWeb	#tag Event		Function MouseDown(X As Integer, Y As Integer) As Boolean		  If X > 0 And Y > 0 And _		    X < Me.Width And Y < Me.Width Then		    Return True		  End If		End Function	#tag EndEvent	#tag Event		Sub MouseUp(X As Integer, Y As Integer)		  If X < 0 And Y < 0 And _		    X > Me.Width And Y > Me.Width Then Return		    		    If lstResults.ListIndex = -1 Then Return		    		    Dim imdbID as String = lstResults.Cell( lstResults.ListIndex, 6 )		    Dim tmdbID as String = lstResults.Cell( lstResults.ListIndex, 1 )		    Dim Title  as String = lstResults.Cell( lstResults.ListIndex, 2 )		    Dim TitleOriginal as String = lstResults.Cell( lstResults.ListIndex, 12 )		    Dim ReleaseDate as String = lstResults.Cell( lstResults.ListIndex, 3 )		    Dim HomePageURL as String = lstResults.Cell( lstResults.ListIndex, 13 )		    		    PopUpWebMenu imdbID, tmdbID, Title, TitleOriginal, ReleaseDate, HomePageURL		End Sub	#tag EndEvent#tag EndEvents