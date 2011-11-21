#tag ClassProtected Class TMDBInherits HTTPSocket	#tag Event		Sub Error(code as integer)		  SocketError( code, Me )		  		Exception err as NilObjectException		  Me.Close		End Sub	#tag EndEvent	#tag Method, Flags = &h0		Sub GetArt(XmlContent as String, Mode as String)		  Dim Xml as new XmlDocument		  Dim xroot, xnode, xitem as XmlNode		  Dim ArtIndex as Integer = -1		  Dim sckt as new HTTPSocket		  Dim f as FolderItem = MovieAttr.FolderParent.Child("extrathumbs")		  		  Scrape.ClearArts		  		  Xml.PreserveWhitespace = False		  Xml.LoadXml( XmlContent )		  xroot = Xml.Child(0).Child(2).FirstChild		  		  If Scrape.Cancelled then Return		  		  If xroot.FirstChild <> Nil and xroot.Value = "Nothing Found." then		    MsgBox Scrape.kNoImagesFound.ReplaceAll( "%s", Mode )		    Return		  End If		  		  xroot = xroot.Child(2)		  		  For i as Integer = 0 to xroot.ChildCount - 1		    xnode = xroot.Child(i)		    		    If Mode = "Poster" and xnode.Name = "Poster" then		      		      For n as Integer = 0 to xnode.ChildCount - 1		        xitem = xnode.Child(n)		        		        If xitem.GetAttribute("size") = "original" then		          ArtURL.Append  xitem.GetAttribute("url")		          ArtSize.Append xitem.GetAttribute("width") + "x" + xitem.GetAttribute("height")		        End If		        If xitem.GetAttribute("size") = "thumb" then ArtThumbURL.Append xitem.GetAttribute("url")		        		      Next		      ArtIndex = ArtIndex + 1		      		    ElseIf Mode = "Fanart" and xnode.Name = "backdrop" then		      		      For n as Integer = 0 to xnode.ChildCount - 1		        xitem = xnode.Child(n)		        		        If xitem.GetAttribute("size") = "original" then		          ArtURL.Append xitem.GetAttribute("url")		          ArtURL.Append xitem.GetAttribute("width") + "x" + xitem.GetAttribute("height")		        End If		        If xitem.GetAttribute("size") = "thumb" then ArtThumbURL.Append xitem.GetAttribute("url")		        		      Next		      ArtIndex = ArtIndex + 1		      		    ElseIf Mode = "ExtraThumbs" and xnode.Name = "backdrop" then		      		      For n as Integer = 0 to xnode.ChildCount - 1		        xitem = xnode.Child(n)		        		        // If xitem.GetAttribute("size") = "poster" then		        // ArtURL.Append xitem.GetAttribute("url")		        // ArtURL.Append xitem.GetAttribute("width") + "x" + xitem.GetAttribute("height")		        // End If		        If xitem.GetAttribute("size") = "poster" then ArtURL.Append xitem.GetAttribute("url")		        		      Next		      ArtIndex = ArtIndex + 1		      		    End If		    		  Next		  		  If Scrape.Cancelled then Return		  		  If Scrape.ArtURL.Ubound <=-1 then		    Progress("close")		    MsgBox Scrape.kNoImagesFound.ReplaceAll( "%s", Mode )		    Return		  End If		  		  		  For i as Integer = 0 to ArtURL.Ubound		    If Scrape.Cancelled then Return		    		    Progress( Localizable.kDownloading + ":", str( i + 1 ) + Localizable.k1of2 + str( ArtIndex + 1 ) + " " + Localizable.kImages, i, ArtIndex )		    If Mode = "ExtraThumbs" then		      If NOT f.Exists then f.CreateAsFolder		      ArtThumb.Append URL2Picture( ArtURL(i), "thumb" + str( i ), "jpg", f )		      // ArtThumb.Append Picture.FromData( ArtThumbURL(i), Prefs.integerForKey("TimeOut") )		    Else		      // ArtThumb.Append URL2Picture( ArtThumbURL(i), "Thumb_" + str( i ) )		      ArtThumb.Append Picture.FromData( sckt.Get( ArtThumbURL(i), Prefs.integerForKey("TimeOut") ) )		      sckt.Close		    End If		    		  Next		  		  Progress("close")		  		  If Mode = "Poster" then		    		  ElseIf Mode = "Fanart" then		    		  End If		  		  If Mode <> "ExtraThumbs" then		    		  End If		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub ScrapeFirstResult(XmlContent as String)		  Dim Xml as new XmlDocument		  Dim xroot, xnode, xitem as XmlNode		  		  If Scrape.Cancelled then Return		  		  Xml.PreserveWhitespace = False		  Xml.LoadXml( XmlContent )		  		  xroot = Xml.Child(0).Child(2)		  		  If xroot.FirstChild <> Nil and xroot.FirstChild.Value = "Nothing Found." then Return		  		  If xroot.FirstChild <> Nil and xroot.ChildCount > 0 then // 1 or more movies found		    xnode = xroot.Child(0)		    If xnode.FirstChild <> Nil then		      For i as Integer = 0 to xnode.ChildCount - 1		        xitem = xnode.Child(i)		        If xitem.FirstChild <> Nil then		          If xitem.Name = "id" then Scrape.TMDBApi( xitem.FirstChild.Value )		        End If		      Next		    End If		  End If		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub ScrapeResults(XmlContent as String)		  If Scrape.Cancelled then Return		  		  Dim Xml as new XmlDocument		  Dim xroot, xnode, xitem as XmlNode		  Dim n as Integer		  		  MovieAttr.ClearProperties		  		  Xml.PreserveWhitespace = False		  Xml.LoadXml( XmlContent )		  xroot = Xml.Child(0).Child(2).FirstChild		  		  For i as Integer = 0 to xroot.ChildCount - 1		    xnode = xroot.Child(i)		    		    If xnode.FirstChild <> Nil then		      		      Select Case xnode.Name		        		      Case "name"		        MovieAttr.Title = xnode.FirstChild.Value		        MovieAttr.TitleSort = Articulator( MovieAttr.Title )		        		      case "original_name"		        MovieAttr.TitleOriginal = xnode.FirstChild.Value		        		      case "id"		        MovieAttr.ID_TMDB = xnode.FirstChild.Value		        		      case "imdb_id"		        MovieAttr.ID_IMDB = xnode.FirstChild.Value		        		      case "overview"		        MovieAttr.DescriptionPlot = xnode.FirstChild.Value		        		      case "certification"		        MovieAttr.RatingMPAA = xnode.FirstChild.Value		        		      case "rating"		        MovieAttr.Rating = Val( xnode.FirstChild.Value )		        		      case "votes"		        MovieAttr.RatingVotes = val( xnode.FirstChild.Value )		        		      case "released"		        MovieAttr.DatePremiered = xnode.FirstChild.Value		        MovieAttr.DateYear = Val( MovieAttr.DatePremiered.Left(4) )		        		      case "runtime"		        MovieAttr.InfoVideoRuntime = xnode.FirstChild.Value		        		      case "categories"		        For n = 0 to xnode.ChildCount - 1		          MovieAttr.Genres.Append xnode.Child(n).GetAttribute("name")		        Next		        		      case "studios"		        For n = 0 to xnode.ChildCount - 1		          MovieAttr.Studios.Append xnode.Child(n).GetAttribute("name")		        Next		        		      case "countries"		        For n = 0 to xnode.ChildCount - 1		          MovieAttr.Countries.Append xnode.Child(n).GetAttribute("name")		        Next		        		      case "cast"		        For n = 0 to xnode.ChildCount - 1		          xitem = xnode.Child(n)		          		          // Append Actor		          If xitem.GetAttribute("job") = "Actor" and xitem.GetAttribute("name") <> "" and xitem.GetAttribute("character") <> "" and xitem.GetAttribute("thumb") <> "" then		            // Job = actor, name = name, character = character, thumburl = thumburl		            MovieAttr.ActorName.Append xitem.GetAttribute("name")		            MovieAttr.ActorRole.Append xitem.GetAttribute("character")		            MovieAttr.ActorThumbURL.Append xitem.GetAttribute("thumb").ReplaceAll("/w45/", "/w185/")		          ElseIf xitem.GetAttribute("job") = "Actor" and xitem.GetAttribute("name") <> "" and xitem.GetAttribute("character") <> "" and xitem.GetAttribute("thumb") = "" then		            // Job = actor, name = name, character = character, thumburl = empty		            MovieAttr.ActorName.Append xitem.GetAttribute("name")		            MovieAttr.ActorRole.Append xitem.GetAttribute("character")		            MovieAttr.ActorThumbURL.Append ""		          ElseIf xitem.GetAttribute("job") = "Actor" and xitem.GetAttribute("name") <> "" and xitem.GetAttribute("character") = "" and xitem.GetAttribute("thumb") = "" then		            // Job = actor, name = name, character = empty, thumburl = empty		            MovieAttr.ActorName.Append xitem.GetAttribute("name")		            MovieAttr.ActorRole.Append ""		            MovieAttr.ActorThumbURL.Append ""		          ElseIf xitem.GetAttribute("job") = "Actor" and xitem.GetAttribute("name") <> "" and xitem.GetAttribute("character") = "" and xitem.GetAttribute("thumb") <> "" then		            // Job = actor, name = name, character = empty, thumburl = thumburl		            MovieAttr.ActorName.Append xitem.GetAttribute("name")		            MovieAttr.ActorRole.Append ""		            MovieAttr.ActorThumbURL.Append xitem.GetAttribute("thumb").ReplaceAll("/w45/", "/w185/")		          End If		          		          // Append Director		          If xnode.GetAttribute("job") = "Director" then		            If MovieAttr.CreditDirector <> "" then		              MovieAttr.CreditDirector = MovieAttr.CreditDirector + ", " + xnode.GetAttribute("name")		            Else		              MovieAttr.CreditDirector = xnode.GetAttribute("name")		            End If		          End If		          		          // Append Writer		          If xnode.GetAttribute("job") = "screenplay" then		            If MovieAttr.CreditWriter <> "" then		              MovieAttr.CreditWriter = MovieAttr.CreditWriter + ", " + xnode.GetAttribute("name")		            Else		              MovieAttr.CreditWriter = xnode.GetAttribute("name")		            End If		          End If		          		        Next		        		      case "images"		        		        For n = 0 to xnode.ChildCount - 1		          xitem = xnode.Child(n)		          If xitem.GetAttribute("type") = "poster"   and xitem.GetAttribute("size") = "original" then MovieAttr.ART_PosterURLs.Append      xitem.GetAttribute("url")		          If xitem.GetAttribute("type") = "backdrop" and xitem.GetAttribute("size") = "original" then MovieAttr.ART_FanartURLs.Append      xitem.GetAttribute("url")		          If xitem.GetAttribute("type") = "backdrop" and xitem.GetAttribute("size") = "thumb"    then MovieAttr.Art_FanartThumbURLs.Append xitem.GetAttribute("url")		        Next		        		        Dim MovieFile as FolderItem = FindMovieItem( MovieAttr.FolderParent )		        		        // Download Poster		        If MovieAttr.ART_PosterURLs.Ubound > -1 and FindImagePoster( MovieAttr.FolderParent ) = Nil and Prefs.boolForKey("AutoDownloadPoster") and NOT Scrape.Cancelled then		          If NOT Scrape.MassSearch then Progress( Localizable.kDownloading + ":", Localizable.kDefaultPoster, 3, 4 )		          		          Dim MoviePosterName as String = Prefs.textStringForKey( "FileNamePoster" )		          If MovieFile <> Nil and MovieFile.Exists then		            MovieAttr.ART_Poster = URL2Picture( MovieAttr.ART_PosterURLs(0), MoviePosterName.Left( MoviePosterName.Len - 4 ).ReplaceAll( "<movie>", MovieFile.NameWithoutExtension ), MoviePosterName.Right(3), MovieAttr.FolderParent )		          ElseIf MoviePosterName.InStr( 0, "poster" ) > 0 or MoviePosterName.InStr( 0, "<movie>" ) > 0 then		            MovieAttr.ART_Poster = URL2Picture( MovieAttr.ART_PosterURLs(0), "poster", MoviePosterName.Right(3), MovieAttr.FolderParent )		          Else		            MovieAttr.ART_Poster = URL2Picture( MovieAttr.ART_PosterURLs(0), "folder", MoviePosterName.Right(3), MovieAttr.FolderParent )		          End If		          		        End If // @END Download Movie Poster		        		        // Download Fanart		        If MovieAttr.ART_FanartURLs.Ubound > -1 and FindImageFanart( MovieAttr.FolderParent ) = Nil and Prefs.boolForKey("AutoDownloadFanart") and NOT Scrape.Cancelled then		          If NOT Scrape.MassSearch then Progress( Localizable.kDownloading + ":", Localizable.kDefaultFanart, 4, 4 )		          		          Dim MovieFanartName as String = Prefs.textStringForKey( "FileNameFanart" )		          If MovieFile <> Nil and MovieFile.Exists and MovieFanartName.InStr( 0, "<movie>" ) > 0 then		            MovieAttr.ART_Fanart = URL2Picture( MovieAttr.ART_FanartURLs(0), MovieFanartName.Left( MovieFanartName.Len - 4 ).ReplaceAll( "<movie>", MovieFile.NameWithoutExtension ), MovieFanartName.Right(3), MovieAttr.FolderParent )		          Else		            MovieAttr.ART_Fanart = URL2Picture( MovieAttr.ART_FanartURLs(0), "fanart", MovieFanartName.Right(3), MovieAttr.FolderParent )		          End If		          		        End If		        		        // @END Images		        		      End Select		      		    End If		    		  Next		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub SearchResults(XmlContent as String, MovieName as String)		  Dim Xml as new XmlDocument		  Dim xroot as XmlNode		  		  Xml.PreserveWhitespace = False		  Xml.LoadXml( XmlContent )		  xroot = Xml.Child(0).Child(2)		  		  If Scrape.Cancelled then Return		  		  // 2+ movies found.		  If xroot.ChildCount > 1 then		    ShowSearchWindow( Xml )		    		    // No movies found during manual search		  ElseIf xroot.FirstChild.Value = "Nothing Found." and Scrape.ManualSearch then		    MsgBox Scrape.kNoMoviesFoundTryAgain		    		    // No movies found during regular search		  ElseIf xroot.FirstChild.Value = "Nothing Found." and NOT Scrape.ManualSearch then		    		    If dlgWindow( Scrape.kNothingFound, Scrape.kManualSearchMovie ) then		      If MovieName <> "" then		        wndSearchMovie.edtSearch.Text = MovieName		      Else		        If wndMain.ppMain.Value = 0 then wndSearchMovie.edtSearch.Text = wndMain.lstMovies.Cell( wndMain.lstMovies.ListIndex, 0 ).ReplaceAll( ".", " " )		      End If		    End If		    		    // Regular search		  ElseIf xroot.ChildCount > 0 and Scrape.ManualSearch then		    ShowSearchWindow( Xml )		    		    // Only 1 result		  ElseIf xroot.ChildCount = 1 and NOT Scrape.ManualSearch then		    Dim xnode, xitem as XmlNode		    For i as Integer = 0 to xroot.ChildCount - 1		      xnode = xroot.Child(i)		      If xnode.FirstChild <> Nil then		        For n as Integer = 0 to xnode.ChildCount - 1		          xitem = xnode.Child(n)		          If xitem.FirstChild <> Nil and xitem.Name = "id" then Scrape.TMDBApi( xitem.FirstChild.Value )		        Next		      End If		    Next		    		  End If		  		  Return		End Sub	#tag EndMethod	#tag Method, Flags = &h1		Protected Sub ShowSearchWindow(Xml as XmlDocument)		  Dim xroot, xnode, xitem, xleaf as XmlNode		  Dim lstbox as Listbox		  Dim sTitle, sYear as String		  		  xroot = Xml.Child(0).Child(2)		  		  If Scrape.Cancelled then Return		  Progress("close")		  wndSearchMovie.Show		  lstbox = wndSearchMovie.lstMovies		  lstbox.DeleteAllRows		  		  For i as Integer = 0 to xroot.ChildCount - 1		    xnode = xroot.Child(i)		    If xnode.FirstChild <> Nil then		      lstbox.AddRow		      		      For n as Integer = 0 to xnode.ChildCount - 1		        xitem = xnode.Child(n)		        		        If xitem.FirstChild <> Nil then		          		          Select Case xitem.Name		            		          Case "name"		            lstbox.Cell( lstbox.LastIndex, 2 ) = xitem.FirstChild.Value		            sTitle = xitem.FirstChild.Value		            		          case "id"		            lstbox.Cell( lstbox.LastIndex, 1 ) = xitem.FirstChild.Value		            		          case "released"		            lstbox.Cell( lstbox.LastIndex, 3 ) = xitem.FirstChild.Value		            sYear = xitem.FirstChild.Value.Left(4)		            		          case "overview"		            lstbox.Cell( lstbox.LastIndex, 4 ) = xitem.FirstChild.Value		            		          case "images"		            For t as Integer = 0 to xitem.ChildCount - 1		              xleaf = xitem.Child(t)		              		              If xleaf.GetAttribute("type") = "poster" and xleaf.GetAttribute("size") = "w154" then _		              lstbox.Cell( lstbox.LastIndex, 5 ) = xleaf.GetAttribute("url")		              If xleaf.GetAttribute("type") = "backdrop" and xleaf.GetAttribute("size") = "thumb" then _		              lstbox.Cell( lstbox.LastIndex, 6 ) = xleaf.GetAttribute("url")		              		              		            Next // @END xitem.ChildCount		            		          End Select		          		          lstbox.Cell( lstbox.LastIndex, 0 ) = sTitle + " (" + sYear + ")"		          		        End If // @END xitem <> Nil		        		      Next // @END xnode.ChildCount		      		    End IF // @END xnode <> Nil		    		  Next // @END xroot.ChildCount		  		  lstbox.SortedColumn = 3		  lstbox.ColumnSortDirection(3) = 2		  lstbox.Sort		  lstbox.ListIndex = 0		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function URL_Images(ID as String) As String		  Return "http://api.themoviedb.org/2.1/Movie.getImages/" + Prefs.textStringForKey("DBLanguage") + "/xml/" + ApiKey + "/" + ID		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function URL_Info(ID as String) As String		  If ID.Left(2) = "tt" then		    // IMDB Lookup		    Return "http://api.themoviedb.org/2.1/Movie.imdbLookup/" + Prefs.textStringForKey("DBLanguage") + "/xml/" + ApiKey + "/" + ID		  Else		    // TMDB Lookup		    Return "http://api.themoviedb.org/2.1/Movie.getInfo/" + Prefs.textStringForKey("DBLanguage") + "/xml/" + ApiKey + "/" + ID		  End If		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function URL_Search(MovieName as String) As String		  Return "http://api.themoviedb.org/2.1/Movie.search/" + Prefs.textStringForKey("DBLanguage") + "/xml/" + ApiKey + "/" + String2Entities( MovieName )		End Function	#tag EndMethod	#tag Note, Name = TMDB Api Docs				http://api.themoviedb.org/2.1	#tag EndNote	#tag Constant, Name = ApiKey, Type = String, Dynamic = False, Default = \"683359f622e4e27f41832a019d90b002", Scope = Public	#tag EndConstant	#tag Constant, Name = MirrorPath, Type = String, Dynamic = False, Default = \"http://hwcdn.themoviedb.org", Scope = Public	#tag EndConstant	#tag ViewBehavior		#tag ViewProperty			Name="Address"			Visible=true			Group="Behavior"			Type="String"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="defaultPort"			Group="Behavior"			InitialValue="0"			Type="integer"			InheritedFrom="HTTPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="httpProxyAddress"			Group="Behavior"			Type="string"			EditorType="MultiLineEditor"			InheritedFrom="HTTPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="httpProxyPort"			Group="Behavior"			InitialValue="0"			Type="integer"			InheritedFrom="HTTPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			Type="Integer"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Port"			Visible=true			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="yield"			Group="Behavior"			InitialValue="0"			Type="boolean"			InheritedFrom="HTTPSocket"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass