ALTER TABLE "job" ADD CONSTRAINT job_person_id_fkey FOREIGN KEY (person_id) REFERENCES person (person_id) MATCH SIMPLE ON DELETE RESTRICT;