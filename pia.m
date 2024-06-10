% Cargar la imagen
imagen_original = imread('craneo.png');

% Mostrar la imagen original
imshow(imagen_original);
title('Imagen Original');

% Permitir al usuario elegir la transformación geométrica
opcion = menu('Seleccione una transformación geométrica:', ...
    'Traslación', 'Homotecia', 'Rotación', 'Cizallamiento', 'Radiales', 'Salir');

switch opcion
    case 1
        % Traslación
        % Solicitar al usuario la cantidad de píxeles para trasladar en X e Y
        delta_x = input('Introduce el desplazamiento en X: ');
        delta_y = input('Introduce el desplazamiento en Y: ');
        
        % Aplicar traslación
        imagen_transformada = imtranslate(imagen_original, [delta_x, delta_y]);
    case 2
        % Homotecia
        % Solicitar al usuario el factor de escala en X e Y
        escala_x = input('Introduce el factor de escala en X: ');
        escala_y = input('Introduce el factor de escala en Y: ');
        
        % Aplicar homotecia
        imagen_transformada = imresize(imagen_original, [size(imagen_original, 1) * escala_x, size(imagen_original, 2) * escala_y]);
    case 3
        % Rotación
        % Solicitar al usuario el ángulo de rotación en grados
        angulo = input('Introduce el ángulo de rotación (en grados): ');
        
        % Aplicar rotación
        imagen_transformada = imrotate(imagen_original, angulo);
    case 4
        % Cizallamiento
        % Solicitar al usuario el ángulo de cizallamiento en grados
        angulo_cizallamiento = input('Introduce el ángulo de cizallamiento (en grados): ');
        
        % Aplicar cizallamiento
        imagen_transformada = imrotate(imagen_original, angulo_cizallamiento, 'bilinear', 'crop');
    case 5
        % Radiales
        % Aplicar una transformación de distorsión radial
        imagen_transformada = imremap(imagen_original, 1);
    case 6
        % Salir
        disp('Saliendo del programa.');
        return;
end

% Mostrar la imagen transformada
figure;
imshow(imagen_transformada);
title('Imagen Transformada');
