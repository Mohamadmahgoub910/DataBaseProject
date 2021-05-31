	use SWProject

	-- 1-   Write a query that enables the students to view their results per course
	select S.Sname , C.Cname , T.Degrees
	from Student S, Course C , Exam E,  TalkSCE T
	where S.Sid = T.STID and C.CID = T.COID
	and E.Eid = T.EXID 


	-- *****************************************


	--2-Write a query that enables the head of department to see evaluation of each course and professor.
	-- The head of each department 
	select P.Pname , D.Dname
	from Professor P , Department D , PMangesDP M
	where M.PRID = P.MGRPR and M.DPID = D.Did

	-- the query 
	select P.Pname , C.Cname , A.EvaluateCourse , A.EvaluatePROF
	from Course C , Professor P , AssignSPC A , Student S
	where A.COID = C.CID and P.Pid=A.PRID and A.STID = S.Sid
	--select * from Professor

	-- **************************************************************

	--3- Write a query that enables you to get top 10 high scores per course
		select top 10  C.Cname , T.Degrees
		from Course C , Student S , Exam E , TalkSCE T
		where C.CID = T.COID and E.Eid=T.EXID and S.Sid = T.STID
		order by T.Degrees desc

	-- **************************************************************
	--4-  Write a query to get the highest evaluation professor from the set of
		--professors teaching the same course
		-- We don't have much value to see res but we write the query
		select top (5) P.Pname , A.EvaluatePROF
		from Professor P , Course C , Student S , AssignSPC A
		where A.PRID = P.Pid and A.COID=C.CID and A.STID=S.Sid
		order by A.EvaluatePROF desc

	-- **************************************************************
		--5- Write a query to flag the lowest 5 evaluated courses
		
		select top(5) Cname , A.EvaluateCourse
		from Course C , AssignSPC A  
		where A.COID =C.CID 
		order by A.EvaluateCourse

		-- The lowest 5 degrees in courses 
		select top (5) * 
		from Course C , Student S , Exam E , TalkSCE T 
		where C.CID = T.COID and S.Sid = T.STID and T.EXID=E.Eid
		order by T.Degrees 
	-- **************************************************************