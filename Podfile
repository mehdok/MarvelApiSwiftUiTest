platform :ios, '14.1'
inhibit_all_warnings!

##
def king_fisher
  pod 'Kingfisher/SwiftUI', '~> 5.15.7'
end


####
target 'DomainLayer' do
    use_frameworks!
    workspace 'MarvelApiSwiftUiTest'
    project 'DomainLayer/DomainLayer.xcodeproj'
    
target 'DomainLayerTests' do
      inherit! :search_paths
      # Pods for testing
      
    end
end

####
target 'NetworkLayer' do
    use_frameworks!
    workspace 'MarvelApiSwiftUiTest'
    project 'NetworkLayer/NetworkLayer.xcodeproj'
        
    target 'NetworkLayerTests' do
      inherit! :search_paths
      # Pods for testing
      
    end
end

####
target 'DataLayer' do
    use_frameworks!
    workspace 'MarvelApiSwiftUiTest'
    project 'DataLayer/DataLayer.xcodeproj'

target 'DataLayerTests' do
      inherit! :search_paths
      # Pods for testing
      
    end
end

####
target 'DesignSystem' do
    use_frameworks!
    workspace 'MarvelApiSwiftUiTest'
    project 'DesignSystem/DesignSystem.xcodeproj'

target 'DesignSystemTests' do
      inherit! :search_paths
      # Pods for testing
      
    end
end

target 'MarvelApiSwiftUiTest' do
  use_frameworks!

  king_fisher

  target 'MarvelApiSwiftUiTestTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MarvelApiSwiftUiTestUITests' do
    # Pods for testing
  end

end
