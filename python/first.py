# -------------------------
# Copyright (c) Sam Cox 2018
# --------------------------
import sys
import os

def main():
	"""Reads in the supplied data file(s), and returns the first letter of each word."""
	assert len(sys.argv) >= 2, 'Please enter the location of the input data file(s).'
	for i in range(1,len(sys.argv)):
		input_filename = sys.argv[i]
		assert os.path.isfile(input_filename), 'Input data file ' + str(input_filename) + ' does not exist.'
		
		with open(input_filename) as in_file:
			first_letters = ''.join([word[0] for line in in_file.readlines() for word in line.split()])

		print(first_letters)
	
	return 0


if __name__ == '__main__':
	main()
