workflow test_location {
    call find_tools
}

task find_tools {
    command <<<
        ls -l /data/HG19_ROOT/hg19_random.fa
        echo "@@@@@@@@@@@@@"
        ls -l /data/HG19_ROOT/hg19.chrom.sizes.bed
        echo "@@@@@@@@@@@@@"
    >>>
    output{
        String message = read_string(stdout())
    }
    runtime {
        docker: "g3chen/bamqc@sha256:2af0fc53ffe86e0f44d110c659035139561b6682cd1f2bc9c2193b132506e009"
    }
}
