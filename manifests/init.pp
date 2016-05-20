class puppet4_template_examples{
  $local_variable = 'This is the value of the local variable.'

  File {
    owner => root,
    group => root,
    mode  => '0400',
  }

  # ERB Template example
  File { '/tmp/erb_template.txt':
    content => template('puppet4_template_examples/erb_template.erb'),
  }  

  # EPP Template Example - pull param from local scope
  File { '/tmp/epp_template_no_param.txt':
    content => epp('puppet4_template_examples/epp_template_no_param.epp'),
  }  

  # EPP Template Example - pass param
  File { '/tmp/erb_template.txt':
    content => epp('puppet4_template_examples/erb_template.epp', {
                 'local_variable' => $local_variable
               } ),
  }  
}
