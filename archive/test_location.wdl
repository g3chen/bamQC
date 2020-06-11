workflow test_location {
	call find_tools
}

task find_tools {
	command {
		whereis mosdepth
		whereis picard
		whereis java
		whereis bedtools
		whereis python
		whereis samtools
		whereis htsfile

		echo "@@@@@@@@@@@@@"
		echo $PATH
		echo "@@@@@@@@@@@@"
		echo $MANPATH
		echo "@@@@@@@@@@@@@@@@"
		echo $PYTHONPATH
		echo "@@@@@@@@@@@@@@@@"
		echo $LD_LIBRARY_PATH
		echo "@@@@@@@@@@@@@@@"
		echo $PKG_CONFIG_PATH
	}
	output{
		String message = read_string(stdout())
	}
	runtime {
		docker: "g3chen/bamqc:1.0"
	}
}

