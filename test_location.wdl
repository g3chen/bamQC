workflow test_location {
	call find_tools
}

task find_tools {
	command {
		ls MOSDEPTH_ROOT
		echo "@@@@@@@@@@@@@"
		ls PICARD_ROOT
		echo "@@@@@@@@@@@@@"
		ls JAVA_ROOT
		echo "@@@@@@@@@@@@@"
		ls BAM_QC_METRICS_ROOT
		echo "@@@@@@@@@@@@@"
		ls BEDTOOLS_ROOT
		echo "@@@@@@@@@@@@@"
		ls PYTHON_ROOT
		echo "@@@@@@@@@@@@@"
		ls SAMTOOLS_ROOT
		echo "@@@@@@@@@@@@@"
		ls HTSLIB_ROOT
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
		docker: "g3chen/bamqc@sha256:2af0fc53ffe86e0f44d110c659035139561b6682cd1f2bc9c2193b132506e009"
		modules: "mosdepth/0.2.9 picard/2.21.2 bam-qc-metrics/0.2.5"
	}
}

