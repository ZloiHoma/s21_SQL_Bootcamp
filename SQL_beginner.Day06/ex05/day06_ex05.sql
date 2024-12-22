COMMENT ON TABLE person_discounts IS 'Table containing information about personal discounts based on the number of orders made by individuals';
COMMENT ON COLUMN person_discounts.id IS 'Unique identifier for each entry in the discounts table';
COMMENT ON COLUMN person_discounts.person_id IS 'Identifier for a person from the order list, linking to the person who made the order';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Identifier for the pizzeria where the person placed an order, linking to the specific restaurant';
COMMENT ON COLUMN person_discounts.discount IS 'Discount percentage applied to the orders of the person';
