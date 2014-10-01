#!/usr/bin/python
# sudo apt-get install untex python-matplotlib

# Imports
import os, commands
import datetime
import matplotlib.pyplot as plt

#
# Configuration
#
# Path to execute commands
path = "./"
# Choose a command to obtain the number of words
command = "bash -c \"pdftotext main.pdf - | egrep -E '\w\w\w+' | iconv -f ISO-8859-15 -t UTF-8 | wc -w\""
#command = 'bash -c "pdflatex main.tex; pdftotext main.pdf - | egrep -E \'\w\w\w+\' | iconv -f ISO-8859-15 -t UTF-8 | wc"'
#command = 'bash -c "untex main.tex | wc -w"'
# Thesis start date
start_year = 2014
start_month = 9
start_day = 20


commandTickets = "bash -c \"find . -name \*.tex -exec grep -H \\PORHACER {} \;|wc -l\""


# Function retrieving the number of words
def getWords(text=None):
	ret = commands.getstatusoutput(command)
	return int(ret[1])
	
def getTickets(text=None):
	ret = commands.getstatusoutput(commandTickets)
	return int(ret[1])

# Function providing a date string
def getDate():
	start = datetime.date(start_year, start_month, start_day)
	today = datetime.date.today()
	return str((today - start).days)

# Set path
os.chdir(path)

# Update the file
f = open('thesisometer.txt', 'a')
f.write(str(getDate())+' '+str(getWords())+'\n')
f.close()

# Update the file
ft = open('thesisometer_tickets.txt', 'a')
ft.write(str(getDate())+' '+str(getTickets())+'\n')
ft.close()

# Read the file and process the lines
X = list()
Y = list()
measures = list()
f = open('thesisometer.txt', 'r')
for line in f.readlines():
	if line[0] != '#':
		v = line.split(' ')
		if len(v) > 1:
			day = 0
			words = 0
			try:
				day = int(v[0])
				words = int(v[1]) 
			except:
				continue
			if len(X) > 0:
				if X[-1] != day:
					X.append(day)
					Y.append(words)
				else:
					Y[-1] = words
			else:
				X.append(day)
				Y.append(words)
f.close()

# Read the file and process the lines
Xt = list()
Yt = list()
measurest = list()
ft = open('thesisometer_tickets.txt', 'r')
for line in ft.readlines():
	if line[0] != '#':
		v = line.split(' ')
		if len(v) > 1:
			day = 0
			tickets = 0
			try:
				day = int(v[0])
				tickets = int(v[1])*500 
			except:
				continue
			if len(Xt) > 0:
				if Xt[-1] != day:
					Xt.append(day)
					Yt.append(tickets)
				else:
					Yt[-1] = tickets
			else:
				Xt.append(day)
				Yt.append(tickets)
ft.close()

print Xt
print Yt
import sys
figure = True
if len(sys.argv) > 1:
	args = sys.argv[1:]
	if 'donotprintfigure' in args:
		figure = False

print getWords()
print 'Figure', figure
if figure:
	# Create figure, save and show plot
	fig = plt.figure(figsize=(15,6))
	start = datetime.date(start_year, start_month, start_day)
	start_string = str(start)
	ax = fig.add_subplot(111, xlabel='Days since '+start_string)
	p1, = ax.plot(X, Y)
	p2, = ax.plot(Xt, Yt)
	plt.legend([p1, p2], ["Words", "TO-DO list length (x500)"], loc=2)

	plt.show()
	fig.savefig("thesisometer.png", dpi=100)

