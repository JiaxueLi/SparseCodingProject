
function outputImage = gamma_decompress(inputImage, gammaType)

tempImage = double(inputImage)/255;

switch gammaType
    
    case 'srgb'

        a = .055;
        
        outputImage = (tempImage>.04045).* ((tempImage+a)./(1+a)).^2.4 + ~(tempImage>.04045) .* (tempImage./12.92);
    
    case 'ntsc'
        
        outputImage = tempImage.^2.2 ;
        
    case 'linear'
        
        outputImage = tempImage ;
        
    otherwise
        
        error('Gamma Type not recognized') ;
        
end
