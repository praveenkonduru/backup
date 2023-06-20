using System;

//====================================================================================================
//The Free Edition of C++ to C# Converter limits conversion output to 100 lines per file.

//To purchase the Premium Edition, visit our website:
//https://www.tangiblesoftwaresolutions.com/order/order-cplus-to-csharp.html
//====================================================================================================

public static class GlobalMembers
{
	public static node reverse(node head) //reverse the linked list
	{
	node p;
	node q;
	if (head == null)
	{
	return head;
	}
	p = head;
	q = p.next;
	if (q == null)
	{
	return p;
	}
	q = reverse(q);
	p.next.next = p;
	p.next = null;
	return q;
	}

	static int Main()
	{
	node p;
	node q;
	node f;
	node s;
	node answer;
	node final_answer;
	node start_digit;
	int n1;
	int n2;
	int i;
	int carry_over;
	int ans;
	int cnt;
	int flag;
	int cnt_extra;
	int diff = 0;
	Console.Write("Enter the digits in the first number");
	string tempVar = ConsoleInput.ScanfRead();
	if (tempVar != null)
	{
		n1 = int.Parse(tempVar);
	}

	Console.Write("\n Enter the digits separated by space");
	p = new node();
	p.next = null;
	string tempVar2 = ConsoleInput.ScanfRead();
	if (tempVar2 != null)
	{
		p.a = int.Parse(tempVar2);
	}
	f = p; // F POINTS TO THE START OF THE FIRST NUMBER LINKED LIST

	for (i = 1;i < n1;i++)
	{
		q = new node();
		q.next = null;
		string tempVar3 = ConsoleInput.ScanfRead();
		if (tempVar3 != null)
		{
			(q.a) = int.Parse(tempVar3);
		}
		p.next = q;
		p = p.next;
	}

	p = null;
	Console.Write("\n Enter the number of digits in the second number");
	string tempVar4 = ConsoleInput.ScanfRead();
	if (tempVar4 != null)
	{
		n2 = int.Parse(tempVar4);
	}

	Console.Write("\n Enter the number separated by space");
	p = new node();
	p.next = null;
	string tempVar5 = ConsoleInput.ScanfRead();
	if (tempVar5 != null)
	{
		(p.a) = int.Parse(tempVar5);
	}
	s = p; // S POINTS TO THE START OF THE FIRST NUMBER LINKED LIST

	for (i = 0;i < n2 - 1;i++)
	{
		q = new node();
		q.next = null;
		string tempVar6 = ConsoleInput.ScanfRead();
		if (tempVar6 != null)
		{
			(q.a) = int.Parse(tempVar6);
		}
		p.next = q;
		p = p.next;
	}

	//REVERSE THE LINKED LIST NUMBERS
	f = reverse(f);
	s = reverse(s);

	//ADD THE EXTRA ZEROES IF NEEDED
	if (n1 > n2)
	{
		diff = n2 - n1;
		flag = 1;
	}
	else if (n2 > n1)
	{
			diff = n2 - n1;
			flag = 2;
	}

	if (flag == 1)
	{
		p = f;
	}
	else if (flag == 2)
	{
		p = s;
	}

	cnt_extra = 0;
	while (cnt_extra < diff)
	{
			q = new node();
			q.next = null;
			q.a = 0;
			q.next = p;
			p = q;
			cnt_extra++;
	}

	if (flag == 1)
	{
		f = p;
	}
	else if (flag == 2)
	{
		s = p;
	}

	//ADD THE TWO LINKED LISTS
	carry_over = 0;
	cnt = 0;
	while (f != null && s != null)
	{
		ans = f.a + s.a;
		ans = ans + carry_over;
		if ((ans / 10) > 0)
		{

//====================================================================================================
//End of the allowed output for the Free Edition of C++ to C# Converter.

//To purchase the Premium Edition, visit our website:
//https://www.tangiblesoftwaresolutions.com/order/order-cplus-to-csharp.html
//====================================================================================================
