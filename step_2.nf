params.text = 'Hello Bicrolab!' 
text_channel = Channel.of(params.text) 

process SPLITLETTERS { 
    input: 
    val x 

    output: 
    path 'chunk_*' 

    script: 
    """
    printf '$x' | split -b 3 - chunk_
    """
} 

process CONVERTTOUPPER { 
    input: 
    path y 

    output: 
    stdout 

    script: 
    """
    cat $y | tr '[a-z]' '[A-Z]'
    """
} 

workflow { 
    letters_ch = SPLITLETTERS(text_channel) 
    results_ch = CONVERTTOUPPER(letters_ch.flatten()) 
    results_ch.view()
}