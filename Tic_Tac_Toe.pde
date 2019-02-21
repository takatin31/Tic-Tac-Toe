boolean turn = false;
int surface[][] = new int[3][3];
int scoreX = 0, scoreO = 0;
boolean win = false;

void setup()
{
	win = false;
	size(600, 700);
	background(250);
	noFill();
	stroke(0);
	rect(0, 0, this.width, this.height);
	fill(0);
	strokeWeight(5);
	line(0, 100, 600, 100);
	strokeWeight(3);
	line(200, 100, 200, 700);
	line(400, 100, 400, 700);
	line(0, 300, 600, 300);
	line(0, 500, 600, 500);

	for (int i = 0 ; i < 3 ; i++)
	{
		for (int  j = 0 ; j < 3 ; j++)
		{
			surface[i][j] = -1;
		}
	}
	fill(#3C3535);
	rect(260, 10, 80, 30);
	fill(255);
	text("Restart", 280, 30);
	drawScore();
}

void draw()
{
	for (int i = 0 ; i < 3 ; i++)
	{
		for (int  j = 0 ; j < 3 ; j++)
		{
			if(surface[i][j] == 0)
			{
				noFill();
				ellipse(i*200+100, j*200+200, 175, 175);
			}
			else if (surface[i][j] == 10) {
				line(i*200+20, j*200+120, (i+1)*200-20, (j+1)*200+80);
				line((i+1)*200-20, j*200+120, (i)*200+20, (j+1)*200+80);
			}
		}
	}
	if (!win)
		verify();
}

void verify()
{
	boolean win1 = verifyHorizLine();
	boolean win2 = verifyVertiLine();
	boolean win3 = verifyDiagoLine();

	win = win1 || win2 || win3;
}

void drawXWinner()
{
	fill(#01062E);
	rect(100, 200, 400, 400);
	fill(255);
	textAlign(CENTER);
	textSize(24);
	text("X Wins", 300, 400);
	drawScore();
}

void drawOWinner()
{
	fill(#01062E);
	rect(100, 200, 400, 400);
	fill(255);
	textAlign(CENTER);
	textSize(24);
	text("O Wins", 300, 400);
	drawScore();
}

void drawScore()
{
	fill(0);
	textSize(14);
	textAlign(CENTER);
	text("ScoreX : "+scoreX, 100, 60);
	text("ScoreO : "+scoreO, 450, 60);
}

boolean verifyDiagoLine()
{
	boolean yadra = false;
	int s = 0;

	s = surface[0][0]+surface[1][1]+surface[2][2];
	if (s !=0 && s!= 30)
		s = surface[0][2]+surface[1][1]+surface[2][0];
	if (s == 0)
	{	
		drawOWinner();
		scoreO++;
		yadra = true;
	}
	if (s == 30)
	{
		drawXWinner();
		scoreX++;
		yadra = true;
	}
	

	return yadra;
}

boolean verifyHorizLine()
{
	boolean yadra = false;
	int s = 0;

	for (int i = 0 ; i < 3 && !yadra; i++)
	{	s = 0;
		for (int j = 0 ; j < 3 ; j++)
		{
			s += surface[j][i];
		}
		if (s == 0)
		{	
			drawOWinner();
			scoreO++;
			yadra = true;
		}
		if (s == 30)
		{
			drawXWinner();
			scoreX++;
			yadra = true;
		}
	}

	return yadra;
}

boolean verifyVertiLine()
{
	boolean yadra = false;
	int s = 0;

	for (int i = 0 ; i < 3 && !yadra; i++)
	{	s = 0;
		for (int j = 0 ; j < 3 ; j++)
		{
			s += surface[i][j];
		}
		if (s == 0)
		{	
			drawOWinner();
			scoreO++;
			yadra = true;
		}
		if (s == 30)
		{
			drawXWinner();
			scoreX++;
			yadra = true;
		}
	}

	return yadra;
}

void mouseClicked()
{
	if(mouseY > 100)
	{
		int x = mouseX/200;
		int y=(mouseY-100)/200;

		if (surface[x][y] == -1)
		{
			if (turn)
			{
				surface[x][y] = 10;
			}
			else {
				surface[x][y] = 0;
			}
			turn = !turn;
		}
	}
	else {
		if(mouseX>260 && mouseX <340 && mouseY > 10 && mouseY < 40)
		{
			restart();
		}
	}
	

}

void restart()
{
	setup();
}

