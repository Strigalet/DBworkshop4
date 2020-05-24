CREATE OR REPLACE TRIGGER participation_trigger
    BEFORE INSERT ON participation
    FOR EACH ROW

BEGIN

    IF (:new.year > 2020 ) THEN
        RAISE_APPLICATION_ERROR(-20343, 'Time travel is prohibited!');
    END IF;

END;