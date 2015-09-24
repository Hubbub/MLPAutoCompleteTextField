Pod::Spec.new do |s|
  s.name         = "MLPAutoCompleteTextField"
  s.version      = "2.0"
  s.summary      = "Allow adding autocomplete menu to any UITextfield."
  s.homepage     = "https://github.com/Hubbub/MLPAutoCompleteTextField"
  s.license      = { :type => 'MIT', :file => 'MIT_LICENSE.md' }
  s.author       = { "Eddy Borja" => "eddyborja@gmail.com" }
  s.source       = { :git => "https://github.com/EddyBorja/MLPAutoCompleteTextField.git", :tag => "1.6" } 
  s.platform     = :ios, '5.0'
  s.source_files = 'MLPAutoCompleteTextField', 'MLPAutoCompleteTextField/**/*.{h,m}'
  s.public_header_files = 'MLPAutoCompleteTextField/**/*.h'
  s.requires_arc = true
end
