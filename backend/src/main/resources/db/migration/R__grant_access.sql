GRANT SELECT ON TABLE order_product TO read_user;
GRANT SELECT ON TABLE orders TO read_user;
GRANT SELECT ON TABLE product TO read_user;

GRANT ALL ON TABLE order_product TO write_user;
GRANT ALL SELECT ON TABLE orders TO write_user;
GRANT ALL SELECT ON TABLE product TO write_user;
