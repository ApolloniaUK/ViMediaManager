#tag ClassProtected Class TVDBInherits HTTPSocket	#tag Event		Sub Error(code as integer)		  SocketError(code, self)		End Sub	#tag EndEvent	#tag Method, Flags = &h0		Sub GetArt(XmlContent As String, Mode As String)		  // Modes: Poster, Series, Season, Fanart		  Dim Xml as new XmlDocument		  Dim xroot, xnode, xitem as XmlNode		  Dim i, n, ArtIndex as Integer = -1		  'Dim ImagePath(), ImageThumb(), ImageDimensions() As String		  		  Scrape.ClearArts		  		  Xml.PreserveWhitespace = False		  Xml.LoadXml( XmlContent )		  xroot = Xml.Child(0)		  		  for i = 0 to xroot.ChildCount - 1		    xnode = xroot.Child(i)		    		    if xnode.FirstChild <> nil then		      		      for n = 0 to xnode.ChildCount - 1		        xitem = xnode.Child(n)		        		        if xitem.FirstChild <> nil then		          		          if xnode.Child(2).FirstChild.Value = Mode then		            		            Select case xitem.Name		            case "BannerPath"		              ArtIndex = ArtIndex + 1		              Scrape.ArtURL.Append MirrorPath + "/banners/" + xitem.FirstChild.Value		              if Mode = "Poster" then Scrape.ArtThumbURL.Append MirrorPath + "/banners/_cache/" + xitem.FirstChild.Value		            case "BannerType2"		              if Mode = "Poster" or Mode = "Fanart" then scrape.ArtSize.Append xitem.FirstChild.Value		            case "ThumbnailPath"		              Scrape.ArtThumbURL.Append MirrorPath + "/banners/" + xitem.FirstChild.Value		            end select		            		          end if // @END BannerType.value = Mode		          		        end if // @END xitem.FirstChild <> NIL		        		      next// @END xnode.ChildCount		      		    end if // @END xnode.FirstChild <> NIL		    		  next // @END xroot.ChildCount		  		  if Scrape.ArtURL.Ubound <= -1 then		    Progressor("close")		    MsgBox "No images found"		    Return		  end if		  		  // Distribute image		  for i = 0 to Scrape.ArtURL.Ubound		    Progressor("Downloading:", str(ArtIndex + 1) + " " + Mode.ReplaceAll("Series", "Banner") + " images...", ArtIndex, i )		    		    if Mode = "Fanart" then		      Scrape.ArtThumb.Append ScalePic( URL2Picture( ArtURL(i), "Thumb_" + str(i) ) )		    else		      Scrape.ArtThumb.Append URL2Picture( ArtURL(i), "Thumb_" + str(i) )		    end if		    		  next		  		  Progressor("close")		  if Mode = "Poster" then		    wndArtPreview.Width = 400		    wndArtPreview.Height = 400 * 1.47 + 52		  elseif Mode = "Fanart" then		    wndArtPreview.Width = 780		    wndArtPreview.Height = 439 + 52		    'wndArtPreview.Width = 300 * 1.5		    'wndArtPreview.Height = 168 * 1.5 + 52		  elseif Mode = "Series" then		    wndArtPreview.Width = 758		    wndArtPreview.Height = 140 + 52		  end if		  wndArtPreview.Mode = "TVDB-" + Mode		  wndArtPreview.Show		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub ScrapeActors(XmlContent As String)		  Dim Xml as new XmlDocument		  Dim xroot, xnode, xitem as XmlNode		  Dim i, n As Integer		  		  Xml.PreserveWhitespace = False		  Xml.LoadXml( XmlContent )		  		  xroot = Xml.FirstChild		  		  for i = 0 to xroot.ChildCount - 1		    xnode = xroot.Child(i)		    		    if xnode.FirstChild <> nil then		      		      for n = 0 to xnode.ChildCount - 1		        xitem = xnode.Child(n)		        		        'if xitem.FirstChild <> nil then		        		        if xitem.Name = "name" then		          if xitem.FirstChild <> nil then TVAttr.ActorName.Append xitem.FirstChild.Value else TVAttr.ActorName.Append ""		        end if		        		        if xitem.Name = "role" then		          if xitem.FirstChild <> nil then TVAttr.ActorRole.Append xitem.FirstChild.Value else TVAttr.ActorRole.Append ""		        end if		        		        if xitem.Name = "image" then		          if xitem.FirstChild <> nil then TVAttr.ActorThumbURL.Append MirrorPath + "/banners/" + xitem.FirstChild.Value else TVAttr.ActorThumbURL.Append ""		        end if		        		        'end if // @END xitem.FirstChild <> NIL		        		      next // @END xnode.ChildCount		      		    end if // @END xnode.FirstChild <> NIL		    		  next // @END xroot.ChildCount		  		  Return		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub ScrapeAniResults(XmlContent As String)		  Dim Xml as new XmlDocument		  Dim xroot, xnode as XmlNode		  Dim i as Integer		  Dim sTMP as String		  		  Xml.PreserveWhitespace = False		  Xml.LoadXml( XmlContent )		  		  'AnimeAttr.ClearProperties		  		  xroot = Xml.FirstChild.FirstChild		  		  for i = 0 to xroot.ChildCount - 1		    xnode = xroot.Child(i)		    if xnode.FirstChild <> nil then		      		      Select case xnode.Name		        		      case "id"		        AnimeAttr.ID_TVDb = xnode.FirstChild.Value		        		      case "SeriesName"		        'AnimeAttr.Title = xnode.FirstChild.Value		        // Sort Title & Original Title		        'if AnimeAttr.Title.Right(1) = ")" then AnimeAttr.TitleOriginal = AnimeAttr.Title.Left( AnimeAttr.Title.Len - 7 )		        'AnimeAttr.SortTitle = Articulator( AnimeAttr.TitleOriginal )		        		      case "Overview"		        if Preferences.DBPreferance = "TVDB" then		          AnimeAttr.Plot = xnode.FirstChild.Value.ReplaceAll( chr(10), EndOfLine )		        elseif Preferences.DBPreferance = "AniDB" then		          		        end if		        		      case "ContentRating"		        AnimeAttr.MPAA = xnode.FirstChild.Value		        		      case "FirstAired"		        'AnimeAttr.DatePremiered = xnode.FirstChild.Value		        'AnimeAttr.Year = xnode.FirstChild.Value.Left(4)		        		      case "Genre"		        if Preferences.DBPreferance = "TVDB" then		          sTMP = xnode.FirstChild.Value		          if sTMP.Left(1) = "|" then sTMP = sTMP.Right( sTMP.Len - 1 )		          if sTMP.Right(1) = "|" then sTMP = sTMP.Left( sTMP.Len - 1 )		          AnimeAttr.Genre = sTMP.Split("|")		        elseif Preferences.DBPreferance = "AniDB" then		          		        end if		        		      case "IMDB_ID"		        AnimeAttr.ID_IMDB = xnode.FirstChild.Value		        		      case "Network"		        'AnimeAttr.Studio = xnode.FirstChild.Value		        		      case "Rating"		        if Preferences.DBPreferance = "TVDB" then		          AnimeAttr.Rating = val( xnode.FirstChild.Value )		        elseif Preferences.DBPreferance = "AniDB" then		          		        end if		        		        		      case "Runtime"		        AnimeAttr.RuntimeInMinutes = val( xnode.FirstChild.Value )		        		      case "RatingCount"		        if Preferences.DBPreferance = "TVDB" then		          AnimeAttr.Votes = Val( xnode.FirstChild.Value )		        elseif Preferences.DBPreferance = "AniDB" then		          		        end if		        		      case "Status"		        AnimeAttr.Status = xnode.FirstChild.Value		        		      case "Banner"		        'Progressor("Downloading:", "Default banner image...")		        AnimeAttr.ART_Banner = URL2Picture( MirrorPath + "/banners/" + xnode.FirstChild.Value, "Banner", "jpg", AnimeAttr.FolderParent )		        		      case "Fanart"		        'Progressor("Downloading:", "Default fanart image...")		        AnimeAttr.ART_Fanart = URL2Picture( MirrorPath + "/banners/" + xnode.FirstChild.Value, "Fanart", "jpg", AnimeAttr.FolderParent )		        		      case "Poster"		        'Progressor("Downloading:", "Default poster image...")		        AnimeAttr.ART_Poster = URL2Picture( MirrorPath + "/banners/" + xnode.FirstChild.Value, "Poster", "jpg", AnimeAttr.FolderParent )		        		      end select		      		    end if// @END xnode.FirstChild <> NIL		    		  next // @END xroot.ChildCount		  		  Return		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub ScrapeArt(XmlContent As String)		  Dim Xml As new XmlDocument		  dim xroot, xnode, xitem as XmlNode		  Dim i, n as Integer		  		  Dim BannerType, BannerType2, BannerPath, ThumbnailPath, Season As String		  		  Xml.PreserveWhitespace = False		  Xml.LoadXml( XmlContent )		  		  xroot = Xml.FirstChild		  		  for i = 0 to xroot.ChildCount - 1		    xnode = xroot.Child(i)		    		    for n = 0 to xnode.ChildCount - 1		      xitem = xnode.Child(n)		      		      Select case xitem.Name		        		      case "BannerType"		        BannerType = xitem.FirstChild.Value		      case "BannerType2"		        BannerType2 = xitem.FirstChild.Value		      case "BannerPath"		        BannerPath = xitem.FirstChild.Value		      case "ThumbnailPath"		        ThumbnailPath = xitem.FirstChild.Value		      case "Season"		        Season = xitem.FirstChild.Value		        		      end select // @END xitem.Name		      		    Next // @END xnode.ChildCount		    		    if BannerType = "Poster" then		      TVAttr.ART_PosterURLs.Append MirrorPath + "/banners/" + BannerPath		    elseif BannerType = "Series" then		      TVAttr.ART_BannerURLs.Append MirrorPath + "/banners/" + BannerPath		    elseif BannerType = "Season" then		      TVAttr.ART_SeasonNumbers.Append Season		      TVAttr.ART_SeasonURLs.Append MirrorPath + "/banners/" + BannerPath		    elseif BannerType = "Fanart" then		      TVAttr.ART_FanartURLs.Append BannerPath		      TVAttr.ART_FanartDimensions.Append BannerType2		      TVAttr.ART_FanartThumbURLs.Append ThumbnailPath		    end if		    		  next // @END xroot.ChildCount		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub ScrapeFirstResult(XmlContent As String)		  Dim Xml as new XmlDocument		  Dim xroot, xnode, xitem as XmlNode		  Dim i as Integer		  		  Xml.PreserveWhitespace = False		  Xml.LoadXml( XmlContent )		  		  xroot = Xml.Child(0)		  		  if xroot.FirstChild <> nil and xroot.ChildCount > 0 then		    xnode = xroot.Child(0)		    if xnode.FirstChild <> nil then		      for i = 0 to xnode.ChildCount - 1		        xitem = xnode.Child(i)		        if xitem.FirstChild <> nil then		          if xitem.Name = "SeriesID" then Scrape.TVDBApi( xitem.FirstChild.Value )		          'if xitem.Name = "SeriesName" then TestText MovieAttr.FolderParent.Name + " - " + xitem.FirstChild.Value + chr(13) + wndTest.txtArea.Text		        end if		      next		    end if		  end if		  		  Return		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub ScrapeResults(XmlContent As String)		  Dim Xml as new XmlDocument		  Dim xroot, xnode as XmlNode		  Dim i as Integer		  Dim sTMP As String		  		  Xml.PreserveWhitespace = False		  Xml.LoadXml( XmlContent )		  		  TVAttr.ClearProperties		  		  xroot = Xml.FirstChild.FirstChild		  		  for i = 0 to xroot.ChildCount - 1		    xnode = xroot.Child(i)		    if xnode.FirstChild <> nil then		      		      Select case xnode.Name		        		      case "id"		        TVAttr.TVDBID = xnode.FirstChild.Value		        		      case "SeriesName"		        TVAttr.Title = xnode.FirstChild.Value		        // Sort Title & Original Title		        sTMP = TVAttr.Title		        if sTMP.Right(1) = ")" then sTMP = sTMP.Left( sTMP.Len - 7 )		        TVAttr.OriginalTitle = sTMP		        TVAttr.SortTitle = Articulator( sTMP )		        sTMP = ""		        		      case "Overview"		        TVAttr.Plot = xnode.FirstChild.Value.ReplaceAll( chr(10), EndOfLine )		        		      case "ContentRating"		        TVAttr.MPAA = xnode.FirstChild.Value		        		      case "FirstAired"		        TVAttr.Premiered = xnode.FirstChild.Value		        TVAttr.Year = xnode.FirstChild.Value.Left(4)		        		      case "Genre"		        sTMP = xnode.FirstChild.Value		        if sTMP.Left(1) = "|" then sTMP = sTMP.Right( sTMP.Len - 1 )		        if sTMP.Right(1) = "|" then sTMP = sTMP.Left( sTMP.Len - 1 )		        TVAttr.Genre = sTMP.Split("|")		        		      case "IMDB_ID"		        TVAttr.IMDBID = xnode.FirstChild.Value		        		      case "Network"		        TVAttr.Studio = xnode.FirstChild.Value		        		      case "Rating"		        TVAttr.Rating = val( xnode.FirstChild.Value )		        		      case "Runtime"		        TVAttr.RuntimeInMinutes = val( xnode.FirstChild.Value )		        		      case "RatingCount"		        TVAttr.Votes = Val( xnode.FirstChild.Value )		        		      case "Status"		        TVAttr.Status = xnode.FirstChild.Value		        		      case "Banner"		        'Progressor("Downloading:", "Default banner image...")		        TVAttr.ART_Banner = URL2Picture( MirrorPath + "/banners/" + xnode.FirstChild.Value, "Banner", "jpg", TVAttr.FolderParent )		        		      case "Fanart"		        'Progressor("Downloading:", "Default fanart image...")		        TVAttr.ART_Fanart = URL2Picture( MirrorPath + "/banners/" + xnode.FirstChild.Value, "Fanart", "jpg", TVAttr.FolderParent )		        		      case "Poster"		        'Progressor("Downloading:", "Default poster image...")		        TVAttr.ART_Poster = URL2Picture( MirrorPath + "/banners/" + xnode.FirstChild.Value, "Poster", "jpg", TVAttr.FolderParent )		        		      end select		      		    end if// @END xnode.FirstChild <> NIL		    		  next // @END xroot.ChildCount		  		  Return		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function SearchFirstResult(XmlContent As String) As String		  TestText XmlContent		  Return ""		  		  Dim Xml as new XmlDocument		  Dim xroot, xnode, xitem as XmlNode		  Dim i, n as Integer		  		  Xml.PreserveWhitespace = False		  Xml.LoadXml( XmlContent )		  xroot = Xml.Child(0)		  		  if xroot.ChildCount > 1 then // 2 or more shows found.		    SearchWindow( Xml )		    		  elseif xroot.ChildCount = 0 and Scrape.ManualSearch then // No shows found during MANUAL search		    Progressor("close")		    MsgBox "No series found, try again with less keywords or an alternative title"		    		  elseif xroot.ChildCount = 0 and NOT Scrape.ManualSearch then // No shows found during REGULAR search		    Progressor("close")		    		    if wndMain.lstTVShows.ListIndex > -1 and dlgWindow("No series found", "Do you want to do a manual search?") then		      wndSearchShow.Show		      wndSearchShow.lstFoundShows.DeleteAllRows		      		      wndSearchShow.edtSearchField.Text = wndMain.lstTVShows.Cell( wndMain.lstTVShows.ListIndex, 0 )		      wndSearchShow.edtSearchField.SelectAll		    end if		    		  elseif xroot.ChildCount > 0 and Scrape.ManualSearch then // Manual search		    SearchWindow( Xml )		    		  elseif xroot.ChildCount = 1 and not Scrape.ManualSearch then // Return with the only show found		    		    for i = 0 to xroot.ChildCount - 1		      xnode = xroot.Child(i)		      for n = 0 to xnode.ChildCount - 1		        xitem = xnode.Child(n)		        if xitem.FirstChild <> nil then		          if xitem.Name = "seriesid" then Scrape.TVDBApi( xitem.FirstChild.Value )		        end if		      next		    next		    		  end if		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub SearchResults(XmlContent As String)		  Dim Xml as new XmlDocument		  Dim xroot, xnode, xitem as XmlNode		  Dim i, n as Integer		  		  Xml.PreserveWhitespace = False		  Xml.LoadXml( XmlContent )		  xroot = Xml.Child(0)		  		  if xroot.ChildCount > 1 then // 2 or more shows found.		    SearchWindow( Xml )		    		  elseif xroot.ChildCount = 0 and Scrape.ManualSearch then // No shows found during MANUAL search		    Progressor("close")		    MsgBox "No series found, try again with less keywords or an alternative title"		    		  elseif xroot.ChildCount = 0 and NOT Scrape.ManualSearch then // No shows found during REGULAR search		    Progressor("close")		    		    if wndMain.lstTVShows.ListIndex > -1 and dlgWindow("No series found", "Do you want to do a manual search?") then		      wndSearchShow.Show		      wndSearchShow.lstFoundShows.DeleteAllRows		      		      wndSearchShow.edtSearchField.Text = wndMain.lstTVShows.Cell( wndMain.lstTVShows.ListIndex, 0 )		      wndSearchShow.edtSearchField.SelectAll		    end if		    		  elseif xroot.ChildCount > 0 and Scrape.ManualSearch then // Manual search		    SearchWindow( Xml )		    		  elseif xroot.ChildCount = 1 and not Scrape.ManualSearch then // Return with the only show found		    		    for i = 0 to xroot.ChildCount - 1		      xnode = xroot.Child(i)		      for n = 0 to xnode.ChildCount - 1		        xitem = xnode.Child(n)		        if xitem.FirstChild <> nil then		          if xitem.Name = "seriesid" then Scrape.TVDBApi( xitem.FirstChild.Value )		        end if		      next		    next		    		  end if		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub SearchWindow(Xml as XmlDocument)		  Dim xroot, xnode, xitem as XmlNode		  Dim lstBox as listbox		  Dim i, n as Integer		  		  xroot = Xml.Child(0)		  Progressor("close")		  		  wndSearchShow.show		  lstBox = wndSearchShow.lstFoundShows		  lstBox.DeleteAllRows		  		  for i = 0 to xroot.ChildCount - 1		    xnode = xroot.Child(i)		    		    lstBox.AddRow		    		    for n = 0 to xnode.ChildCount - 1		      xitem = xnode.Child(n)		      		      if xitem.FirstChild <> nil then		        		        Select case xitem.Name		        case "SeriesName"		          lstBox.Cell( lstBox.LastIndex, 0 ) = xitem.FirstChild.Value		        case "SeriesID"		          lstBox.Cell( lstBox.LastIndex, 1 ) = xitem.FirstChild.Value		        case "FirstAired"		          lstBox.Cell( lstBox.LastIndex, 2 ) = xitem.FirstChild.Value		        case "Overview"		          lstBox.Cell( lstBox.LastIndex, 3 ) = xitem.FirstChild.Value		        case "Banner"		          lstBox.Cell( lstBox.LastIndex, 4 ) = xitem.FirstChild.Value		        end select // @END xitem.Name		        		      end if // @END xitem.FirstChild <> NIL		      		    next// @END xnode.ChildCount		    		  next// @END xroot.ChildCount		  		  lstBox.ListIndex = 0		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub UpdateShowStatus(XmlContent As String)		  Dim Xml as new XmlDocument		  Dim xroot, xnode as XmlNode		  Dim i as integer		  		  Xml.PreserveWhitespace = False		  Xml.LoadXml( XmlContent )		  xroot = Xml.FirstChild.FirstChild		  		  for i = 0 to xroot.ChildCount - 1		    xnode = xroot.Child(i)		    if xnode.FirstChild <> nil then		      		      Select case xnode.Name		        		      case "status"		        if wndMain.ppMedia.Value = 1 then TVAttr.Status = xnode.FirstChild.Value		        if wndMain.ppMedia.Value = 2 then AnimeAttr.Status = xnode.FirstChild.Value		        		      case "FirstAired"		        if wndMain.ppMedia.Value = 1 then		          TVAttr.Premiered = xnode.FirstChild.Value		          TVAttr.Year      = xnode.FirstChild.Value.Left(4)		        elseif wndMain.ppMedia.Value = 2 then		          AnimeAttr.DatePremiered = xnode.FirstChild.Value		          AnimeAttr.Year          = xnode.FirstChild.Value.Left(4)		        end if		        		      end select		      'if xnode.Name = "status" then TVAttr.Status = xnode.FirstChild.Value		      		    end if		  next // @END xroot.ChildCount		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function URL_Actors(ID As String) As String		  Return MirrorPath + "/api/" + ApiKey + "/series/" + ID + "/actors.xml"		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function URL_Art(ID As String) As String		  Return MirrorPath + "/api/" + ApiKey + "/series/" + ID + "/banners.xml"		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function URL_EpisodeGuide(ID As String) As String		  Return MirrorPath + "/api/" + ApiKey + "/series/" + ID + "/all/" + DBLanguage + ".zip"		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function URL_EpisodeInfo(ID As String, SeasonNumber As String, EpisodeNumber As String) As String		  Return MirrorPath + "/api/" + ApiKey + "/series/" + ID + "/default/" + SeasonNumber + "/" + EpisodeNumber + "/ " + DBLanguage + ".xml"		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function URL_Info(ID As String) As String		  Return MirrorPath + "/api/" + ApiKey + "/series/" + ID + "/" + DBLanguage + ".xml"		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function URL_Search(SeriesName As String) As String		  Return MirrorPath + "/api/GetSeries.php?seriesname=" + String2Entities(SeriesName)		End Function	#tag EndMethod	#tag Note, Name = TVDB Api Docs				http://thetvdb.com/wiki/index.php?title=Programmers_API	#tag EndNote	#tag Constant, Name = ApiKey, Type = String, Dynamic = False, Default = \"47B3269189813ECF", Scope = Public	#tag EndConstant	#tag Constant, Name = MirrorPath, Type = String, Dynamic = False, Default = \"http://thetvdb.com", Scope = Public	#tag EndConstant	#tag ViewBehavior		#tag ViewProperty			Name="Address"			Visible=true			Group="Behavior"			Type="String"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="defaultPort"			Group="Behavior"			InitialValue="0"			Type="integer"			InheritedFrom="HTTPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="httpProxyAddress"			Group="Behavior"			Type="string"			EditorType="MultiLineEditor"			InheritedFrom="HTTPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="httpProxyPort"			Group="Behavior"			InitialValue="0"			Type="integer"			InheritedFrom="HTTPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			Type="Integer"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Port"			Visible=true			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="yield"			Visible=true			Group="Behavior"			InitialValue="1"			Type="boolean"			InheritedFrom="HTTPSocket"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass