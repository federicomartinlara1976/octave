function test_conversiones()
% TEST_CONVERSIONES Ejecuta tests de este módulo
    printf('Testing conversiones... ');
    
    assert(deg2rad(180), pi, 1e-10);
    assert(rad2deg(pi), 180, 1e-10);
    
    hms = deg2hms(15);
    assert(hms, [1, 0, 0], 1e-10);
    
    deg = hms2deg(1, 0, 0);
    assert(deg, 15, 1e-10);
    
    printf('OK ✅\n');
endfunction 
