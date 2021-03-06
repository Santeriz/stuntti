DELIMITER //
CREATE PROCEDURE money_action(IN id INT, IN amount DOUBLE)
BEGIN 
START TRANSACTION;
 UPDATE person SET money=money+amount WHERE id_person=id AND money+amount>0;
  SET @test=row_count();
   IF (@test>0) THEN
    COMMIT;
    IF(amount>0) THEN
      INSERT INTO action(id_person,amount,date,action_type) VALUES(id,amount,NOW(),'pano');
    ELSE
      INSERT INTO action(id_person,amount,date,action_type) VALUES(id,amount,NOW(),'otto');
    END IF;  
    ELSE
      ROLLBACK;
    END IF;    
END
//
DELIMITER ;