# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2026_05_02_163137) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "supabase_vault"
  enable_extension "uuid-ossp"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "aal_level", ["aal1", "aal2", "aal3"]
  create_enum "action", ["INSERT", "UPDATE", "DELETE", "TRUNCATE", "ERROR"]
  create_enum "buckettype", ["STANDARD", "ANALYTICS", "VECTOR"]
  create_enum "code_challenge_method", ["s256", "plain"]
  create_enum "equality_op", ["eq", "neq", "lt", "lte", "gt", "gte", "in"]
  create_enum "factor_status", ["unverified", "verified"]
  create_enum "factor_type", ["totp", "webauthn", "phone"]
  create_enum "oauth_authorization_status", ["pending", "approved", "denied", "expired"]
  create_enum "oauth_client_type", ["public", "confidential"]
  create_enum "oauth_registration_type", ["dynamic", "manual"]
  create_enum "oauth_response_type", ["code"]
  create_enum "one_time_token_type", ["confirmation_token", "reauthentication_token", "recovery_token", "email_change_token_new", "email_change_token_current", "phone_change_token"]

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.text "rule"
    t.text "question"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
