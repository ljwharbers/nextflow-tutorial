params.text = "Hello bicrolab"
text_channel = Channel.of(params.text)

process REVERSE_TEXT {
    input:
        val x
    
    output:
        stdout
    
    script:
        """
        echo ${x} | rev
        """
}

workflow {
    text_channel.view()
    results = REVERSE_TEXT(text_channel)
    results.view()
}