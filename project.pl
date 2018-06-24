:- use_module(library(jpl)).



start:-
	jpl_new('javax.swing.JFrame', ['Friend Finder'], Frame),
	jpl_new('javax.swing.JTextArea', [0,10], TextArea),
	jpl_new('java.awt.Font',['Serif',25,18],Font),
	jpl_new('javax.swing.JOptionPane', [], OptionPane),	
	jpl_call(Frame, getContentPane, [], CP),
	jpl_get('java.awt.Color',darkGray,Dark),
	jpl_get('java.awt.Color',white,White),
	jpl_call(CP,setBackground,[Dark],_),
	jpl_call(Frame, setLocation, [450,220], _),
	jpl_call(Frame, setSize, [400,400], _),
	jpl_call(Frame, setBackground,[Dark], _),
	jpl_call(TextArea, setFont, [Font], _),
	jpl_call(TextArea, setForeground, [White], _),
	jpl_call(TextArea, setBackground, [Dark], _),
	jpl_call(Frame, setVisible, [@(true)], _),
	jpl_call(TextArea,setEditable,[@(false)],_),
	jpl_call(TextArea,setText,['~~~~~~~~~~~~MENUE~~~~~~~~~~~~\n\n1)Search\n2)Find Name\n3)History\n4)Exit\n\n'],_),
	jpl_call(OptionPane, showInputDialog, [Frame,TextArea],Menue),
	(jpl_call(Frame, setVisible, [@(false)], _),
	(Menue=='1'->(search);
	Menue=='2'->confirmation('data');
	Menue=='3'->history;
	Menue=='4'->exit_app;
	Menue == @(null) ->exit_app; 
	show_empty_and_not_found_message('Invalid Input','1'))).
	
	
search:-
	jpl_new('javax.swing.JFrame', ['Friend Finder'], Frame),
	jpl_new('javax.swing.JTextArea', [0,10], TextArea),
	jpl_new('java.awt.Font',['Serif',25,18],Font),
	jpl_new('javax.swing.JOptionPane', [], OptionPane),	
	jpl_call(Frame, getContentPane, [], CP),
	jpl_get('java.awt.Color',darkGray,Dark),
	jpl_get('java.awt.Color',white,White),
	jpl_call(CP,setBackground,[Dark],_),
	jpl_call(Frame, setLocation, [450,220], _),
	jpl_call(Frame, setSize, [400,400], _),
	jpl_call(Frame, setBackground,[Dark], _),
	jpl_call(TextArea, setFont, [Font], _),
	jpl_call(TextArea, setForeground, [White], _),
	jpl_call(TextArea, setBackground, [Dark], _),
	jpl_call(Frame, setVisible, [@(true)], _),
	jpl_call(TextArea,setEditable,[@(false)],_),
	jpl_call(TextArea,setText,['\n~~~~~Search~~~~~\n1)Search by name\n2)Search by Subject Code,\n          Section,Semester\n          and Year\n3)Back to main menue\n\n'],_),
		jpl_call(OptionPane, showInputDialog, [Frame,TextArea],Input),
		jpl_call(Frame, dispose, [], _),
		search_path(Input).
		
	
		
search_path(Inpu):-
		Inpu == '1'->(search_by_name);
		Inpu == '2'->(search_by_academic('search'));
		Inpu == '3'->(start);
		Inpu == @(null)->start;
		show_empty_and_not_found_message('Invalid Input','search').
		
		
		
search_by_name:-
	jpl_new('javax.swing.JFrame', ['Friend Finder'], Frame),
	jpl_new('javax.swing.JTextArea', [0,10], TextArea),
	jpl_new('java.awt.Font',['Serif',25,18],Font),
	jpl_new('javax.swing.JOptionPane', [], OptionPane),	
	jpl_call(Frame, getContentPane, [], CP),
	jpl_get('java.awt.Color',darkGray,Dark),
	jpl_get('java.awt.Color',white,White),
	jpl_call(CP,setBackground,[Dark],_),
	jpl_call(Frame, setLocation, [450,220], _),
	jpl_call(Frame, setSize, [400,400], _),
	jpl_call(Frame, setBackground,[Dark], _),
	jpl_call(TextArea, setFont, [Font], _),
	jpl_call(TextArea, setForeground, [White], _),
	jpl_call(TextArea, setBackground, [Dark], _),
	jpl_call(Frame, setVisible, [@(true)], _),
	jpl_call(TextArea,setText,['Enter Name : '],_),
	jpl_call(TextArea,setEditable,[@(false)],_),
	jpl_call(OptionPane, showInputDialog, [Frame,TextArea],Name),
	jpl_call(Frame, setVisible, [@(false)], _),
	((Name == @(null)->(search);
		((atom_length(Name,X),X=\=0)->find_by_name(Name);
				show_empty_and_not_found_message('You can''t keep this field empty','1')))
	).
	


find_by_name(Name):-
	findall((Name->Subcode->Section->Semester->Year->Sex->Hair->Hight->Dresstype->Skincolor),data(Name,Subcode,Section,Semester,Year,Sex,Hair,Hight,Dresstype,Skincolor),List),maplist(term_to_atom, List, L1),
	atomic_list_concat(L1,'\n',L2),
	
	atom_concat('Searched by name :  ',Name,A),
	atom_concat(A,'\n',B),
	write_to_file(B),
	
	atom_concat('Name -> Subject Code-> Section -> Semester ->Year->Sex -> Hair Size -> Hight ->Dress type -> Skin Color\n',' _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _  _ _ _ _ _ _ _ _ _ \n',X),
	show_result(L2,X).
	
		
		
search_by_academic(Type):-
	jpl_new('javax.swing.JFrame', ['Friend Finder'], Frame),
	jpl_new('javax.swing.JTextArea', [0,10], TextArea),
	jpl_new('java.awt.Font',['Serif',25,18],Font),
	jpl_new('javax.swing.JOptionPane', [], OptionPane),	
	jpl_call(Frame, getContentPane, [], CP),
	jpl_get('java.awt.Color',darkGray,Dark),
	jpl_get('java.awt.Color',white,White),
	jpl_call(CP,setBackground,[Dark],_),
	jpl_call(Frame, setLocation, [450,220], _),
	jpl_call(Frame, setSize, [400,400], _),
	jpl_call(Frame, setBackground,[Dark], _),
	jpl_call(TextArea, setFont, [Font], _),
	jpl_call(TextArea, setForeground, [White], _),
	jpl_call(TextArea, setBackground, [Dark], _),
	jpl_call(Frame, setVisible, [@(true)], _),
	jpl_call(TextArea,setText,['Enter Subject Code : '],_),
	jpl_call(OptionPane, showInputDialog, [Frame,TextArea],Subcode),
	jpl_call(TextArea,setEditable,[@(false)],_),
	jpl_call(Frame, setVisible, [@(false)], _),	
	(\+(Subcode == @(null)),(atom_length(Subcode,W),W=\=0)->
	(
			jpl_call(Frame, setVisible, [@(true)], _),
			jpl_call(TextArea,setText,['Enter Section: '],_),
			jpl_call(OptionPane, showInputDialog, [Frame,TextArea],Section),
			
			jpl_call(Frame, setVisible, [@(false)], _),

			(\+(Section == @(null)),atom_length(Section,X),X=\=0->
			(
				jpl_call(Frame, setVisible, [@(true)], _),
				jpl_call(TextArea,setText,['Enter Semester : \n1)Spring\n2)Summer\n3)Fall'],_),
				jpl_call(OptionPane, showInputDialog, [Frame,TextArea],Semester),
				jpl_call(Frame, setVisible, [@(false)], _),
				
				
				(\+(Semester == @(null)),atom_length(Semester,Y),Y=\=0->
				(
					jpl_call(Frame, setVisible, [@(true)], _),
					jpl_call(TextArea,setText,['Enter Year : '],_),
					jpl_call(OptionPane, showInputDialog, [Frame,TextArea],Year),
					jpl_call(Frame, setVisible, [@(false)], _),
					
					(\+(Year == @(null)),atom_length(Year,Z),Z=\=0->
					(
						jpl_call(Frame, setVisible, [@(true)], _),
						jpl_call(Frame, dispose, [],_),
						((Type==search)->showname(Subcode,Section,Semester,Year);
						(
						
								jpl_call(Frame, setVisible, [@(true)], _),
								jpl_call(TextArea,setText,['Enter Sex : \n1)Male\n2)Female\n3)Other\n'],_),
								jpl_call(OptionPane, showInputDialog, [Frame,TextArea],Sex),
								jpl_call(Frame, setVisible, [@(false)], _),
								
								
								( \+(Sex == @(null)),atom_length(Sex,S),S=\=0->
								
																		
									(jpl_call(Frame, setVisible, [@(true)], _),
									jpl_call(TextArea,setText,['Enter Hair size : \n1)Long\n2)Medium\n3)Short\n'],_),
									jpl_call(OptionPane, showInputDialog, [Frame,TextArea],Hair),
									jpl_call(Frame, setVisible, [@(false)], _),
									
									( \+(Hair == @(null)),atom_length(Hair,M),M=\=0->
									
										(
										jpl_call(Frame, setVisible, [@(true)], _),
										jpl_call(TextArea,setText,['Enter Height : \n1)Long (5.8'' and above\n2)Medium (5'' to 5.7''\n3)Short (Below 5'')\n'],_),
										jpl_call(OptionPane, showInputDialog, [Frame,TextArea],Height),
										jpl_call(Frame, setVisible, [@(false)], _),
										
										( \+(Height == @(null)),atom_length(Height,G),G=\=0->
										
											(
												jpl_call(Frame, setVisible, [@(true)], _),
												jpl_call(TextArea,setText,['Enter Dresstype usually he/she wear : \n\n1)Borkha\n2)Panjabi\n3)Shirt,\n4)T-Shirt,\n5)Shari\n6)Salwar-kamij'],_),
												jpl_call(OptionPane, showInputDialog, [Frame,TextArea],Dresstype),
												jpl_call(Frame, setVisible, [@(false)], _),
												
												( \+(Dresstype == @(null)),atom_length(Dresstype,H),H=\=0->
												
													(
													
														jpl_call(Frame, setVisible, [@(true)], _),
														jpl_call(TextArea,setText,['Enter Skin Color : \n1)White\n2)Wheatish\n3)Dark\n'],_),
														jpl_call(OptionPane, showInputDialog, [Frame,TextArea],Skincolor),
														jpl_call(Frame, setVisible, [@(false)], _),
														jpl_call(Frame, dispose, [], _),
														find_friend(Subcode,Section,Semester,Year,Sex,Hair,Height,Dresstype,Skincolor)
		
																
													)
												
												);(show_empty_and_not_found_message('You can''t keep this field empty','1'),search)
												
											
											)
										
										);(show_empty_and_not_found_message('You can''t keep this field empty','1'),search)
										
										
										)
								
									);(show_empty_and_not_found_message('You can''t keep this field empty','1'),search)
														
								)
						
	
						);(show_empty_and_not_found_message('You can''t keep this field empty','1'),search))
								
						)
						
					));show_empty_and_not_found_message('You can''t keep this field empty','1')
					
				));(show_empty_and_not_found_message('You can''t keep this field empty','1'),search)
				
			));(show_empty_and_not_found_message('You can''t keep this field empty','1'),search)
	));(show_empty_and_not_found_message('You can''t keep this field empty','1'),search).


show_result(L2,Type):-
	print_loading,
	atom_length(L2,X),
	atom_concat(Type,L2, P),
	jpl_new('javax.swing.JFrame', ['Friend Finder'], F),
	jpl_new('javax.swing.JTextArea', [10,20], T),
	jpl_new('java.awt.Dimension',[10,10],Size),
	jpl_get('java.awt.Color',darkGray,Dark),
	jpl_new('java.awt.Font',['Serif',25,18],Font),
	jpl_get('java.awt.Color',white,White),
	jpl_call(T,setEditable,[@(false)],_),
	jpl_new('javax.swing.JScrollPane',[T],SP),
	jpl_call(SP,setPreferredSize,[Size],_),
	jpl_call(F,add,[SP],_),
	jpl_call(T, setFont, [Font], _),
	jpl_call(T, setBackground,[Dark], _),
	jpl_call(T, setForeground, [White], _),
	jpl_call(F, setLocation, [450,220], _),
	jpl_call(F, setSize, [650,400], _),
	jpl_call(T,setWrapStyleWord,[@(true)],_),
	jpl_call(F, setVisible, [@(false)],_),
	X>0->
	(jpl_call(T,setText,[P],_),jpl_call(F, setVisible, [@(true)], _));
	show_empty_and_not_found_message('Sorry no data found','1').



	
showname(Subcode,Section,Semester,Year):-
	(get_semester(Semester,Semester2)),
	findall(Name,data(Name,Subcode,Section,Semester2,Year,_,_,_,_,_),List),maplist(term_to_atom, List, L1),
	atomic_list_concat(L1,'\n',L2),atom_concat('        Name         \n','_ _ _ _ _ _ _ _ _ _ _\n',X),
	
	atom_concat('( ',Subcode,A),
	atom_concat(A,' , ',B),
	atom_concat(B,Section,C),
	atom_concat(C,' , ',D),
	atom_concat(D,Semester2,E),
	atom_concat(E,' , ',F),
	atom_concat(F,Year,G),
	atom_concat(G,' ) \n',H),
	atom_concat('Search by (Subject Code , Section , Semester , Year ) :  ',H,I),
	write_to_file(I),
	
	show_result(L2,X).

	

show_empty_and_not_found_message(X,Goto):-
	jpl_new('javax.swing.JFrame', ['Friend Finder'], F),
	jpl_call(F, getContentPane, [], CP),
	jpl_new('javax.swing.JTextArea', [0,20], T),
	jpl_get('java.awt.Color',darkGray,Dark),
	jpl_new('java.awt.Font',['Serif',25,22],Font),
	jpl_get('java.awt.Color',white,White),
	jpl_call(CP,setBackground,[Dark],_),
	jpl_call(T,setEditable,[@(false)],_),
	jpl_call(T, setFont, [Font], _),
	jpl_call(T, setBackground,[Dark], _),
	jpl_call(T, setForeground, [White], _),
	jpl_call(F, setLocation, [450,220], _),
	jpl_call(F, setSize, [400,400], _),
	jpl_call(T,setWrapStyleWord,[@(true)],_),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(T,setEditable,[@(false)],_),
	jpl_call(T,setText,[X],_),
	jpl_call('javax.swing.JOptionPane', showMessageDialog, [F,T],_),
	jpl_call(F, dispose, [],_),
	(Goto=='1'->start;
	Goto=='history'->history;
	Goto=='search'->search).
	

	
exit_app:-
	jpl_new('javax.swing.JFrame', ['Friend Finder'], Frame),
	jpl_new('javax.swing.JTextArea', [0,10], TextArea),
	jpl_new('java.awt.Font',['Serif',25,18],Font),
	jpl_new('javax.swing.JOptionPane', [], OptionPane),	
	jpl_call(Frame, getContentPane, [], CP),
	jpl_get('java.awt.Color',darkGray,Dark),
	jpl_get('java.awt.Color',white,White),
	jpl_call(CP,setBackground,[Dark],_),
	jpl_call(Frame, setLocation, [450,220], _),
	jpl_call(Frame, setSize, [400,400], _),
	jpl_call(Frame, setBackground,[Dark], _),
	jpl_call(TextArea, setFont, [Font], _),
	jpl_call(TextArea, setForeground, [White], _),
	jpl_call(TextArea, setBackground, [Dark], _),
	jpl_call(TextArea,setEditable,[@(false)],_),
	jpl_call(Frame, setVisible, [@(true)], _),
	jpl_call(TextArea,setText,['Are you sure you want to close this app ? '],_),
	jpl_call(OptionPane, showConfirmDialog, [Frame,TextArea],Sure),
	(jpl_call(Frame, dispose, [],_),Sure =:= 1->(start); 
	Sure =:= 0->halt;(start)).
	

print_loading:-
	write('Loading...'),nl,sleep(1),
	write('Loading...'),nl,sleep(1),
	write('Loading...'),nl,sleep(1).
	
confirmation(X):-
	jpl_new('javax.swing.JFrame', ['Friend Finder'], Frame),
	jpl_new('javax.swing.JTextArea', [0,10], TextArea),
	jpl_new('java.awt.Font',['Serif',25,18],Font),
	jpl_new('javax.swing.JOptionPane', [], OptionPane),	
	jpl_call(Frame, getContentPane, [], CP),
	jpl_get('java.awt.Color',darkGray,Dark),
	jpl_get('java.awt.Color',white,White),
	jpl_call(CP,setBackground,[Dark],_),
	jpl_call(Frame, setLocation, [450,220], _),
	jpl_call(Frame, setSize, [500,400], _),
	jpl_call(Frame, setBackground,[Dark], _),
	jpl_call(TextArea, setFont, [Font], _),
	jpl_call(TextArea, setForeground, [White], _),
	jpl_call(TextArea,setEditable,[@(false)],_),
	jpl_call(TextArea, setBackground, [Dark], _),
	jpl_call(Frame, setVisible, [@(true)], _),
	(
		X=='data'->
		(
				jpl_call(TextArea,setText,['To find a friend''s name you need to answer 9 question\nYou can''t skip any question\n Do you want to proceed ?\n'],_),
				jpl_call(OptionPane, showConfirmDialog, [Frame,TextArea],Sure),
				(jpl_call(Frame, dispose, [],_),Sure =:= 1->(start);
				Sure =:= 0->ask_question;
				start
				)
		);
		X=='history'->
		(
				jpl_call(TextArea,setText,['\nAll history will be deleted     \ndo you want to proceed??   \n\n'],_),
				jpl_call(OptionPane, showConfirmDialog, [Frame,TextArea],Sure),
				(jpl_call(Frame, dispose, [],_),Sure =:= 1->(history); Sure =:= 0->clear_history;history)
		
		)
			
	).

	

ask_question:-
	search_by_academic('ask').
	
find_friend(Subcode,Section,Semester,Year,Sex,Hair,Height,Dresstype,Skincolor):-
	get_semester(Semester,S),get_sex(Sex,Se),get_hair_height(Hair,Ha),get_hair_height(Height,He),
	get_dress_type(Dresstype,Dr),get_skin_color(Skincolor,Sk),
	findall(Name,data(Name,Subcode,Section,S,Year,Se,Ha,He,Dr,Sk),List),maplist(term_to_atom, List, L1),
	
	atom_concat('( ',Subcode,A),
	atom_concat(A,' , ',B),
	atom_concat(B,Section,C),
	atom_concat(C,' , ',D),
	atom_concat(D,S,E),
	atom_concat(E,' , ',F),
	atom_concat(F,Year,G),
	atom_concat(G,' , ',H),
	atom_concat(H,Se,I),
	atom_concat(I,' , ',J),
	atom_concat(J,Ha,K),
	atom_concat(K,' , ',L),
	atom_concat(L,He,M),
	atom_concat(M,' , ',N),
	atom_concat(N,Dr,O),
	atom_concat(O,' , ',P),
	atom_concat(P,Sk,Q),
	atom_concat(Q,' ) ',R),
	atom_concat(R,'\n',T),
	
	
	
	atom_concat('Searched By ( Subject Code , Section , Semester , Year , Sex ,Hair , Hight , Dress Type, Skin Color ) :  ',T,V),
	write_to_file(V),

	
	atomic_list_concat(L1,'\n',L2),atom_concat('        Name         \n','_ _ _ _ _ _ _ _ _ _ _\n',X),
	show_result(L2,X).


get_semester(X,Y):-
	X =='1' ->Y=spring;X=='2'->Y=summer;X=='3'->Y=fall;Y=invalid.
	
get_sex(X,Y):-
	X=='1'->Y=male;X=='2'->Y=female;X=='3'->Y=other;Y=invalid.
	
get_hair_height(X,Y):-
	X=='1'->Y=long;X=='2'->Y=medium;X=='3'->Y=short;Y=invalid.
	
get_dress_type(X,Y):-
	X=='1'->Y=borkha;X=='2'->Y=panjabi;X=='3'->Y=shirt;X=='4'->Y='t-shirt';X=='5'->Y=shari;X=='6'->Y='salwar-kamij';Y=invalid.
	
get_skin_color(X,Y):-
		X=='1'->Y=white;X=='2'->Y=wheatish;X=='3'->Y=dark;Y=invalid.
		
	
		
		
get_tim(X,Time):-
	get_time(T), stamp_date_time(T, date(Y, Mo,D, H, M, _, _, _, _), 'local')
	,atom_concat(Y,'  ',A),atom_concat(Mo,'/',B),atom_concat(D,'/',C),
	atom_concat(C,B,E),atom_concat(E,A,F),atom_concat(H,':',G),atom_concat(M,'  ',I),
	atom_concat(G,I,K),atom_concat(F,K,Time).
		

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~File~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

write_to_file(Text):-
			open('history.txt',append,Stream),
			get_tim('',Time),
			atom_concat(Time,Text,T),
			write(Stream,T),
			nl,
			close(Stream).
			

is_eof(FlHndl, CharCode, CurrentLine, FileAkku, FileContent) :-
        CharCode == -1,
        append(FileAkku, [CurrentLine], FileContent),
        close(FlHndl), !.

is_newline(FlHndl, CharCode, CurrentLine, FileAkku, FileContent) :-
        CharCode == 10,
		append(CurrentLine,'\n',Line),
        append(FileAkku, [Line], NextFileAkku),
        read_loop(FlHndl, '', NextFileAkku, FileContent).

append_char(FlHndl, CharCode, CurrentLine, FileAkku, FileContent) :-
        char_code(Char, CharCode),
        atom_concat(CurrentLine, Char, NextCurrentLine),
         read_loop(FlHndl, NextCurrentLine, FileAkku, FileContent).

read_file(FileName, FileContent) :-
        open(FileName, read, FlHndl),
        read_loop(FlHndl, '', [], FileContent), !.

read_loop(FlHndl, CurrentLine, FileAkku, FileContent) :-
        get_code(FlHndl, CharCode),
        ( is_eof(FlHndl, CharCode, CurrentLine, FileAkku, FileContent)
        ; is_newline(FlHndl, CharCode, CurrentLine, FileAkku, FileContent)
        ; append_char(FlHndl, CharCode, CurrentLine, FileAkku, FileContent)).
		
read_from_file:-
	read_file('history.txt',InputLines),atomic_list_concat(InputLines,'', Atom),
	atom_concat('              History            \n','_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ \n',A),
	show_result(Atom,A).
	
	
history:-
	jpl_new('javax.swing.JFrame', ['Friend Finder'], Frame),
	jpl_new('javax.swing.JTextArea', [0,10], TextArea),
	jpl_new('java.awt.Font',['Serif',25,18],Font),
	jpl_new('javax.swing.JOptionPane', [], OptionPane),	
	jpl_call(Frame, getContentPane, [], CP),
	jpl_get('java.awt.Color',darkGray,Dark),
	jpl_get('java.awt.Color',white,White),
	jpl_call(CP,setBackground,[Dark],_),
	jpl_call(Frame, setLocation, [450,220], _),
	jpl_call(Frame, setSize, [400,400], _),
	jpl_call(Frame, setBackground,[Dark], _),
	jpl_call(TextArea, setFont, [Font], _),
	jpl_call(TextArea, setForeground, [White], _),
	jpl_call(TextArea, setBackground, [Dark], _),
	jpl_call(Frame, setVisible, [@(true)], _),
	jpl_call(TextArea,setEditable,[@(false)],_),
	jpl_call(TextArea,setText,['\n~~~~~History~~~~~\n\n1)Show History\n2)Clear History\n\n'],_),
		jpl_call(OptionPane, showInputDialog, [Frame,TextArea],Input),
		jpl_call(Frame, dispose, [], _),
		(Input=='1' ->read_from_file;
		 Input=='2' ->confirmation('history');
		 Input== @(null)->start;
		 show_empty_and_not_found_message('Invalid Input','history')).
		 
clear_history:-
	open('history.txt',write,Stream),
	close(Stream),history.
	
	
	
	

	
	
	
/*data(name,subject code,section,semester,year,sex,hair,height,dresstype,skin colour)*/


data('ashraf-uz-zaman shahriar',cse105,'3',summer,'2014',male,medium,medium,'t-shirt',white).
data('ashraf-uz-zaman shahriar',eng101,'1',summer,'2014',male,medium,medium,'t-shirt',white).
data('ashraf-uz-zaman shahriar',mat101,'3',summer,'2014',male,medium,medium,'t-shirt',white).

data('md jakaria parvez',cse105,'2',fall,'2014',male,long,medium,shirt,dark).
data('md jakaria parvez',eng101,'12',fall,'2014',male,long,medium,shirt,dark).
data('md jakaria parvez',mat101,'5',fall,'2014',male,long,medium,shirt,dark).

data('md rawfur monzur jim',cse109,'3',spring,'2015',male,short,long,short,panjabi,wheatish).
data('md rawfur monzur jim',eng101,'8',spring,'2015',male,short,long,short,panjabi,wheatish).
data('md rawfur monzur jim',phy109,'2',spring,'2015',male,short,long,short,panjabi,wheatish).

data('jannatul ferdaus',cse225,'2',summer,'2015',female,long,medium,'salwar-kamij',dark).
data('jannatul ferdaus',mat104,'1',summer,'2015',female,long,medium,'salwar-kamij',dark).
data('jannatul ferdaus',sta102,'5',summer,'2015',female,long,medium,'salwar-kamij',dark).


data('md nurulahsan',cse207,'1',fall,'2015',male,medium,medium,'t-shirt',dark).
data('md nurulahsan',cse225,'2',fall,'2015',male,medium,medium,'t-shirt',dark).
data('md nurulahsan',sta102,'3',fall,'2015',male,medium,medium,'t-shirt',dark).


data('labiba tasnim jaeen',cse365,'2',spring,'2017',female,long,medium,'t-shirt',white).
data('labiba tasnim jaeen',cse207,'2',spring,'2016',female,long,medium,'t-shirt',white).
data('labiba tasnim jaeen',cse225,'1',spring,'2017',female,long,medium,'t-shirt',white).
data('labiba tasnim jaeen',eco101,'12',spring,'2017',female,long,medium,'t-shirt',white).

data('rasel miah',cse365,'2',spring,'2017',male,short,short,shirt,wheatish).
data('rasel miah',cse245,'1',summer,'2016',male,short,short,shirt,wheatish).
data('rasel miah',eco102,'2',summer,'2016',male,short,short,shirt,wheatish).
data('rasel miah',phy209,'3',summer,'2016',male,short,short,shirt,wheatish).


data('sk. sabit faisal',cse225,'3',fall,'2016',male,medium,medium,'t-shirt',wheatish).
data('sk. sabit faisal',cs248,'2',fall,'2016',male,medium,medium,'t-shirt',wheatish).
data('sk. sabit faisal',cse251,'1',fall,'2016',male,medium,medium,'t-shirt',wheatish).
data('sk. sabit faisal',phy209,'1',fall,'2016',male,medium,medium,'t-shirt',wheatish).


data('md. sadman hossain',cse105,'1',summer,'2014',male,short,long,'t-shirt',wheatish).
data('md. sadman hossain',eng099,'3',summer,'2014',male,short,long,'t-shirt',wheatish).
data('md. sadman hossain',mat101,'1',summer,'2014',male,short,long,'t-shirt',wheatish).

data('md. omar faruqe nabil',cse105,'2',fall,'2014',male,short,medium,shirt,white).
data('md. omar faruqe nabil',eng102,'1',fall,'2014',male,short,medium,shirt,white).
data('md. omar faruqe nabil',mat102,'3',fall,'2014',male,short,medium,shirt,white).



data('al amin',cse301,'2',fall,'2016',male,long,long,'t-shirt',white).
data('al amin',cse345,'1',fall,'2016',male,long,long,'t-shirt',white).
data('al amin',cse365,'3',fall,'2016',male,long,long,'t-shirt',white).


data('nazmul hasan',cse325,'1',summer,'2016',male,medium,medium,shirt,wheatish).
data('nazmul hasan',cse345,'2',summer,'2016',male,medium,medium,shirt,wheatish).
data('nazmul hasan',sta102,'2',summer,'2016',male,medium,medium,shirt,wheatish).



data('tahsin yahya tushi',cse102,'3',spring,'2015',female,medium,short,'salwar-kamij',dark).
data('tahsin yahya tushi',eng102,'9',spring,'2015',female,medium,short,'salwar-kamij',dark).
data('tahsin yahya tushi',math101,'6',spring,'2015',female,medium,short,'salwar-kamij',dark).


data('armin hauque',cse205,'1',fall,'2014',female,medium,medium,'salwar-kamij',wheatish).
data('armin hauque',cse225,'2',fall,'2014',female,medium,medium,'salwar-kamij',wheatish).
data('armin hauque',phy109,'3',fall,'2014',female,medium,medium,'salwar-kamij',wheatish).
data('armin hauque',sta102,'2',fall,'2014',female,medium,medium,'salwar-kamij',wheatish).



data('noor ismat ara',che109,'1',summer,'2015',female,medium,medium,'salwar-kamij',white).
data('noor ismat ara',gen201,'3',summer,'2015',female,medium,medium,'salwar-kamij',white).
data('noor ismat ara',mat104,'4',summer,'2015',female,medium,medium,'salwar-kamij',white).



data('afia anzum',che109,'2',spring,'2013',female,medium,medium,'salwar-kamij',wheatish).
data('afia anzum',mat104,'2',spring,'2013',female,medium,medium,'salwar-kamij',wheatish).
data('afia anzum',phy109,'1',spring,'2013',female,medium,medium,'salwar-kamij',wheatish).


data('asm rabby pathan',cse107,'2',fall,'2015',male,short,medium,'t-shirt',dark).
data('asm rabby pathan',gen201,'5',fall,'2015',male,short,medium,'t-shirt',dark).
data('asm rabby pathan',mat104,'2',fall,'2015',male,short,medium,'t-shirt',dark).



data('shah jafor sadek quaderi',cse107,'2',summer,'2012',male,short,medium,'t-shirt',wheatish).
data('shah jafor sadek quaderi',gen201,'6',summer,'2012',male,short,medium,'t-shirt',wheatish).
data('shah jafor sadek quaderi',mat205,'3',summer,'2012',male,short,medium,'t-shirt',wheatish).

data('prapto saha',cse107,'3',spring,'2015',male,medium,medium,shirt,wheatish).


data('prapto saha',eng101,'2',spring,'2015',male,medium,medium,shirt,wheatish).


data('faria tabassum',cse225,'1',summer,'2015',female,long,medium,shirt,wheatish).
data('faria tabassum',eco101,'2',summer,'2015',female,long,medium,shirt,wheatish).
data('faria tabassum',mat104,'3',summer,'2015',female,long,medium,shirt,wheatish).


data('afsana rahman',cse225,'2',fall,'2015',female,medium,short,borkha,wheatish).
data('afsana rahman',phy209,'3',fall,'2015',female,medium,short,borkha,wheatish).
data('afsana rahman',sta102,'2',fall,'2015',female,medium,short,borkha,wheatish).


data('hasan mahmud',cse245,'1',spring,'2016',male,short,medium,shirt,white).
data('hasan mahmud',gen201,'2',spring,'2016',male,short,medium,shirt,white).
data('hasan mahmud',gen225,'12',spring,'2016',male,short,medium,shirt,white).
data('hasan mahmud',phy209,'1',spring,'2016',male,short,medium,shirt,white).



data('rulia islam',cse245,'1',summer,'2016',female,long,short,'salwar-kamij',dark).
data('rulia islam',cse248,'3',summer,'2016',female,long,short,'salwar-kamij',dark).
data('rulia islam',cse301,'2',summer,'2016',female,long,short,'salwar-kamij',dark).



data('mamunur rashid',cse301,'3',fall,'2016',male,medium,medium,shirt,wheatish).
data('mamunur rashid',cse325,'2',fall,'2016',male,medium,medium,shirt,wheatish).
data('mamunur rashid',cse345,'3',fall,'2016',male,medium,medium,shirt,wheatish).


data('tasmia tasmin',cse105,'1',summer,'2014',female,long,medium,'salwar-kamij',white).
data('tasmia tasmin',cse365,'2',spring,'2017',female,long,medium,'salwar-kamij',white).
data('tasmia tasmin',eng101,'1',summer,'2014',female,long,medium,'salwar-kamij',white).


data('md. jahangir alam',cse105,'3',fall,'2014',male,short,medium,'t-shirt',wheatish).
data('md. jahangir alam',eng101,'2',fall,'2014',male,short,medium,'t-shirt',wheatish).
data('md. jahangir alam',mat102,'3',fall,'2014',male,short,medium,'t-shirt',wheatish).


data('md. raisul islam',cse107,'3',spring,'2015',male,short,medium,'t-shirt',wheatish).
data('md. raisul islam',gen201,'8',spring,'2015',male,short,medium,'t-shirt',wheatish).
data('md. raisul islam',mat104,'3',spring,'2015',male,short,medium,'t-shirt',wheatish).


data('farzana hannan hera',cse225,'4',summer,'2015',female,long,medium,'salwar-kamij',wheatish).
data('farzana hannan hera',mat104,'4',summer,'2015',female,long,medium,'salwar-kamij',wheatish).
data('farzana hannan hera',phy109,'4',summer,'2015',female,long,medium,'salwar-kamij',wheatish).


data('md. tanvir ahmed',cse207,'1',fall,'2015',male,medium,medium,'t-shirt',dark).
data('md. tanvir ahmed',cse225,'3',fall,'2015',male,medium,medium,'t-shirt',dark).
data('md. tanvir ahmed',eng109,'4',fall,'2015',male,medium,medium,'t-shirt',dark).


data('risul islam refat',cse225,'4',spring,'2016',male,short,medium,shirt,wheatish).
data('risul islam refat',cse245,'3',spring,'2016',male,short,medium,shirt,wheatish).
data('risul islam refat',gen201,'12',spring,'2016',male,short,medium,shirt,wheatish).
data('risul islam refat',mat205,'4',spring,'2016',male,short,medium,shirt,wheatish).


data('mahmudul hasan',cse245,'4',summer,'2016',male,short,long,'t-shirt',white).
data('mahmudul hasan',eco101,'3',summer,'2016',male,short,long,'t-shirt',white).
data('mahmudul hasan',mat102,'1',summer,'2016',male,short,long,'t-shirt',white).


data('md. imtiaz hossain',cse301,'4',fall,'2016',male,short,long,shirt,wheatish).
data('md. imtiaz hossain',cse350,'1',fall,'2016',male,short,long,shirt,wheatish).
data('md. imtiaz hossain',eco101,'3',fall,'2016',male,short,long,shirt,wheatish).


data('md. daud ali khan',cse105,'1',summer,'2014',male,medium,long,shirt,wheatish).
data('md. daud ali khan',eng101,'3',summer,'2014',male,medium,long,shirt,wheatish).
data('md. daud ali khan',mat101,'2',summer,'2014',male,medium,long,shirt,wheatish).


data('md. riasad rahman',cse107,'2',fall,'2014',male,medium,long,shirt,wheatish).
data('md. riasad rahman',eng101,'1',fall,'2014',male,medium,long,shirt,wheatish).
data('md. riasad rahman',mat102,'2',fall,'2014',male,medium,long,shirt,wheatish).


data('md shariful islam',cse109,'3',spring,'2015',male,short,short,shirt,dark).
data('md shariful islam',mat102,'1',spring,'2015',male,short,short,shirt,dark).
data('md shariful islam',sta102,'2',spring,'2015',male,short,short,shirt,dark).



data('ifrat jahan',cse205,'2',summer,'2015',female,long,medium,'salwar-kamij',wheatish).
data('ifrat jahan',cse225,'1',summer,'2015',female,long,medium,'salwar-kamij',wheatish).
data('ifrat jahan',mat205,'4',summer,'2015',female,long,medium,'salwar-kamij',wheatish).


data('md. alvi tazwar',cse248,'2',fall,'2015',male,medium,medium,'t-shirt',dark).
data('md. alvi tazwar',cse251,'3',fall,'2015',male,medium,medium,'t-shirt',dark).
data('md. alvi tazwar',eco101,'1',fall,'2015',male,medium,medium,'t-shirt',dark).


data('md. fokhor uddin',cse225,'1',spring,'2016',male,medium,medium,'t-shirt',white).
data('md. fokhor uddin',cse248,'3',spring,'2016',male,medium,medium,'t-shirt',white).
data('md. fokhor uddin',phy109,'4',spring,'2016',male,medium,medium,'t-shirt',white).


data('md.ahasan alam sojib',cse245,'1',summer,'2016',male,short,long,'t-shirt',dark).
data('md.ahasan alam sojib',cse375,'2',summer,'2016',male,short,long,'t-shirt',dark).
data('md.ahasan alam sojib',eco102,'5',summer,'2016',male,short,long,'t-shirt',dark).


data('puloma roy',cse301,'1',fall,'2016',female,medium,medium,'salwar-kamij',wheatish).
data('puloma roy',cse325,'2',fall,'2016',female,medium,medium,'salwar-kamij',wheatish).
data('puloma roy',cse350,'3',fall,'2016',female,medium,medium,'salwar-kamij',wheatish).


data('md. golam rabby',cse105,'3',summer,'2014',male,short,long,shirt,white).
data('md. golam rabby',eng099,'2',summer,'2014',male,short,long,shirt,white).
data('md. golam rabby',mat101,'3',summer,'2014',male,short,long,shirt,white).


data('shatabdi sharma',cse107,'3',fall,'2014',female,medium,medium,'salwar-kamij',wheatish).
data('shatabdi sharma',eng101,'8',fall,'2014',female,medium,medium,'salwar-kamij',wheatish).
data('shatabdi sharma',mat102,'3',fall,'2014',female,medium,medium,'salwar-kamij',wheatish).


data('md. sakib hasan',cse107,'2',spring,'2015',male,medium,medium,'t-shirt',white).
data('md. sakib hasan',mat104,'2',spring,'2015',male,medium,medium,'t-shirt',white).
data('md. sakib hasan',phy109,'2',spring,'2015',male,medium,medium,'t-shirt',white).


data('pritam datta',che109,'3',spring,'2016',male,short,medium,'t-shirt',white).
data('pritam datta',cse207,'2',spring,'2016',male,short,medium,'t-shirt',white).
data('pritam datta',eco101,'1',spring,'2016',male,short,medium,'t-shirt',white).


data('md. abdur rahaman',cse205,'2',summer,'2015',male,medium,short,shirt,white).
data('md. abdur rahaman',gen201,'1',summer,'2015',male,medium,short,shirt,white).
data('md. abdur rahaman',mat205,'2',summer,'2015',male,medium,short,shirt,white).


data('rafia farzana',che109,'2',fall,'2015',female,long,medium,'salwar-kamij',white).
data('rafia farzana',cse207,'3',fall,'2015',female,long,medium,'salwar-kamij',white).
data('rafia farzana',sta102,'5',fall,'2015',female,long,medium,'salwar-kamij',white).


data('birat saha',cse207,'1',spring,'2016',male,short,long,'t-shirt',wheatish).
data('birat saha',eco101,'3',spring,'2016',male,short,long,'t-shirt',wheatish).
data('birat saha',mat205,'6',spring,'2016',male,short,long,'t-shirt',wheatish).


data('md. fahim shahrier rasel',cse251,'3',summer,'2016',male,short,medium,shirt,wheatish).
data('md. fahim shahrier rasel',cse325,'2',summer,'2016',male,short,medium,shirt,wheatish).
data('md. fahim shahrier rasel',phy209,'1',summer,'2016',male,short,medium,shirt,wheatish).


data('kevin stephen biswas',cse365,'2',spring,'2017',male,short,short,shirt,wheatish).
data('kevin stephen biswas',cse248,'1',fall,'2016',male,short,short,shirt,wheatish).
data('kevin stephen biswas',cse251,'3',fall,'2016',male,short,short,shirt,wheatish).
data('kevin stephen biswas',cse301,'4',fall,'2016',male,short,short,shirt,wheatish).



data('md. kamrul hasan',cse365,'2',spring,'2017',male,short,short,shirt,wheatish).
data('md. kamrul hasan',cse105,'1',summer,'2014',male,short,short,shirt,wheatish).
data('md. kamrul hasan',eng101,'8',summer,'2014',male,short,short,shirt,wheatish).
data('md. kamrul hasan',mat101,'5',summer,'2014',male,short,short,shirt,wheatish).



data('shahrin nasrin',cse365,'2',spring,'2017',female,medium,short,'salwar-kamij',white).
data('shahrin nasrin',cse107,'1',fall,'2014',female,medium,short,'salwar-kamij',white).
data('shahrin nasrin',eng102,'3',fall,'2014',female,medium,short,'salwar-kamij',white).
data('shahrin nasrin',mat102,'6',fall,'2014',female,medium,short,'salwar-kamij',white).


data('ashik mahmud shawon',cse365,'2',spring,'2017',male,medium,long,'t-shirt',dark).
data('ashik mahmud shawon',cse105,'5',spring,'2015',male,medium,long,'t-shirt',dark).
data('ashik mahmud shawon',gen201,'3',spring,'2015',male,medium,long,'t-shirt',dark).
data('ashik mahmud shawon',mat104,'2',spring,'2015',male,medium,long,'t-shirt',dark).


data('syed nazmus shakib',cse365,'2',spring,'2017',male,short,medium,'t-shirt',wheatish).
data('syed nazmus shakib',gen201,'1',summer,'2015',male,short,medium,'t-shirt',wheatish).
data('syed nazmus shakib',mat205,'5',summer,'2015',male,short,medium,'t-shirt',wheatish).
data('syed nazmus shakib',phy109,'2',summer,'2015',male,short,medium,'t-shirt',wheatish).


data('mukit muntasir',cse365,'2',spring,'2017',male,short,medium,'t-shirt',wheatish).
data('syed nazmus shakib',cse105,'2',fall,'2015',male,short,medium,'t-shirt',wheatish).
data('syed nazmus shakib',mat104,'1',fall,'2015',male,short,medium,'t-shirt',wheatish).
data('syed nazmus shakib',sta102,'2',fall,'2015',male,short,medium,'t-shirt',wheatish).


data('farhan tanvir',cse365,'2',spring,'2017',male,medium,medium,shirt,dark).
data('farhan tanvir',cse350,'2',spring,'2017',male,medium,medium,shirt,dark).
data('farhan tanvir',eco101,'7',spring,'2017',male,medium,medium,shirt,dark).
data('farhan tanvir',cse375,'2',spring,'2017',male,medium,medium,shirt,dark).
data('farhan tanvir',cse248,'3',fall,'2016',male,medium,medium,shirt,dark).
data('farhan tanvir',cse251,'1',fall,'2016',male,medium,medium,shirt,dark).
data('farhan tanvir',cse301,'2',fall,'2016',male,medium,medium,shirt,dark).
data('farhan tanvir',cse245,'1',summer,'2016',male,medium,medium,shirt,dark).
data('farhan tanvir',cse325,'3',summer,'2016',male,medium,medium,shirt,dark).
data('farhan tanvir',phy209,'4',summer,'2016',male,medium,medium,shirt,dark).
data('farhan tanvir',cse207,'1',fall,'2015',male,medium,medium,shirt,dark).
data('farhan tanvir',gen201,'2',fall,'2015',male,medium,medium,shirt,dark).
data('farhan tanvir',mat205,'5',fall,'2015',male,medium,medium,shirt,dark).




data('zahiruddin aqib',cse365,'2',spring,'2017',male,medium,medium,shirt,white).
data('ehsanul hassan',cse365,'2',spring,'2017',male,short,long,shirt,white).

data('mahjaben islam',cse365,'2',spring,'2017',female,long,medium,'salwar-kamij',wheatish).
data('mahiuddin ahmed sumon',cse365,'2',spring,'2017',male,short,medium,shirt,wheatish).
data('md. tahmidul meshkat',cse365,'2',spring,'2017',male,short,long,shirt,wheatish).
data('fahmida noor',cse365,'2',spring,'2017',female,long,medium,'salwar-kamij',dark).

data('rimon kumar',cse365,'2',spring,'2017',male,short,medium,shirt,dark).
data('afia anjum',cse365,'2',spring,'2017',female,long,medium,'salwar-kamij',wheatish).
data('fahmida noor',cse365,'2',spring,'2017',frmale,long,medium,'salwar-kamij',dark).


data('muktasib un nur',cse365,'2',spring,'2017',male,short,medium,shirt,white).
data('mohammad maruf islam',cse365,'2',spring,'2017',male,short,medium,shirt,wheatish).
data('yekramin akter turna',cse365,'2',spring,'2017',female,long,medium,'salwar-kamij',white).


