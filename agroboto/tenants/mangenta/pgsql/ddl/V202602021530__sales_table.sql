-- PostgreSQL DDL for synthetic agropecuary operations (Magenta, 2025 Q4)

CREATE TABLE IF NOT EXISTS operations (
  operation_id          TEXT PRIMARY KEY,
  operation_date        DATE NOT NULL,

  provider              TEXT NOT NULL,

  customer_id           TEXT NOT NULL,
  customer_name         TEXT NOT NULL,

  product_category      TEXT NOT NULL,
  product_name          TEXT NOT NULL,
  formulation_or_trait  TEXT NOT NULL,
  package_size          TEXT NOT NULL,

  quantity              INTEGER NOT NULL CHECK (quantity > 0),
  unit_price            NUMERIC(12,2) NOT NULL CHECK (unit_price >= 0),

  discount_pct          NUMERIC(6,4) NOT NULL CHECK (discount_pct BETWEEN 0 AND 1),
  gross_amount          NUMERIC(14,2) NOT NULL CHECK (gross_amount >= 0),
  discount_amount       NUMERIC(14,2) NOT NULL CHECK (discount_amount >= 0),
  net_amount            NUMERIC(14,2) NOT NULL CHECK (net_amount >= 0),

  tax_pct               NUMERIC(6,4) NOT NULL CHECK (tax_pct BETWEEN 0 AND 1),
  tax_amount            NUMERIC(14,2) NOT NULL CHECK (tax_amount >= 0),
  total_amount          NUMERIC(14,2) NOT NULL CHECK (total_amount >= 0),

  payment_method        TEXT NOT NULL,
  region                TEXT NOT NULL,
  channel               TEXT NOT NULL,

  order_status          TEXT NOT NULL,
  ship_mode             TEXT NOT NULL,

  warehouse_code        TEXT NOT NULL,
  lot_or_batch          TEXT NOT NULL,
  invoice_number        TEXT NOT NULL UNIQUE
);

-- Indexes for analytics & filtering
CREATE INDEX IF NOT EXISTS idx_operations_date
  ON operations (operation_date);

CREATE INDEX IF NOT EXISTS idx_operations_customer
  ON operations (customer_id);

CREATE INDEX IF NOT EXISTS idx_operations_category
  ON operations (product_category);
