ALTER TABLE documents
ADD COLUMN IF NOT EXISTS storage_key TEXT;

UPDATE documents
SET storage_key = stored_filename
WHERE storage_key IS NULL;

ALTER TABLE documents
ALTER COLUMN storage_key SET NOT NULL;

CREATE UNIQUE INDEX IF NOT EXISTS documents_storage_key_unique
ON documents (storage_key);