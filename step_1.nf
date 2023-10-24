params.text = "Hello Bicrolab!"
text_channel = Channel.of(params.text)

process PRINT_TEXT {
    input:
        val x
    
    output:
        stdout
    
    script:
        """
        echo ${x}
        """
}

workflow {
    results = PRINT_TEXT(text_channel)
    results.view()
}