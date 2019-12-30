# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_30_000216) do

  create_table "arts", force: :cascade do |t|
    t.integer "user_id"
    t.string "unique_token"
    t.string "element_id"
    t.integer "art_id"
    t.float "x_pos"
    t.float "y_pos"
    t.string "shape"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.integer "comment_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "anon_token"
    t.string "image"
    t.integer "bot_id"
    t.integer "proposal_id"
    t.integer "vote_id"
    t.integer "like_id"
    t.integer "note_id"
    t.integer "shared_item_id"
    t.integer "item_library_id"
    t.integer "survey_id"
  end

  create_table "connections", force: :cascade do |t|
    t.integer "user_id"
    t.integer "other_user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "invite"
    t.boolean "request"
    t.string "anon_token"
    t.string "unique_token"
    t.boolean "redeemed"
    t.boolean "grant_dev_access"
    t.boolean "message_folder"
    t.integer "connection_id"
    t.integer "total_messages_seen"
    t.boolean "grant_mod_access"
    t.string "invite_password"
    t.boolean "portal"
    t.integer "total_items_seen"
    t.datetime "last_typing_at"
    t.boolean "mod"
    t.boolean "admin"
    t.string "title"
  end

  create_table "crono_jobs", force: :cascade do |t|
    t.string "job_id", null: false
    t.text "log", limit: 1073741823
    t.datetime "last_performed_at"
    t.boolean "healthy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_crono_jobs_on_job_id", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "image"
    t.integer "user_id"
    t.datetime "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "anon_token"
    t.string "image"
    t.integer "user_id"
    t.string "unique_token"
    t.boolean "open"
    t.string "passphrase"
    t.boolean "pass_protected"
    t.integer "ratification_threshold"
    t.integer "view_limit"
    t.datetime "expires_at"
    t.boolean "hidden"
    t.string "social_structure"
    t.integer "total_items_seen"
  end

  create_table "item_categories", force: :cascade do |t|
    t.integer "item_library_id"
    t.integer "user_id"
    t.string "name"
    t.string "body"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_libraries", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unique_token"
    t.integer "user_id"
  end

  create_table "item_requests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "shared_item_id"
    t.string "unique_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "accepted", default: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.string "anon_token"
    t.integer "post_id"
    t.integer "comment_id"
    t.string "unique_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "proposal_id"
    t.integer "vote_id"
    t.integer "like_id"
    t.integer "liked_user_id"
    t.boolean "love"
    t.boolean "whoa"
    t.boolean "hype"
    t.integer "shared_item_id"
    t.integer "survey_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "receiver_id"
    t.integer "group_id"
    t.text "body"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "anon_token"
    t.string "receiver_token"
    t.integer "connection_id"
    t.string "sender_token"
    t.string "salt"
    t.string "unique_token"
  end

  create_table "notes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sender_id"
    t.string "message"
    t.string "action"
    t.boolean "seen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "anon_token"
    t.string "sender_token"
    t.integer "item_id"
    t.string "item_token"
  end

  create_table "pictures", force: :cascade do |t|
    t.integer "post_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "classifier_name"
    t.integer "order"
    t.integer "proposal_id"
    t.integer "user_id"
    t.boolean "reverted_back_to"
    t.integer "shared_item_id"
    t.integer "item_library_id"
    t.integer "survey_id"
  end

  create_table "portals", force: :cascade do |t|
    t.string "unique_token"
    t.datetime "expires_at"
    t.integer "remaining_uses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "cluster"
    t.integer "cluster_id"
    t.integer "creator_id"
    t.integer "user_id"
    t.boolean "mod"
    t.boolean "dev"
    t.boolean "admin"
    t.boolean "expired"
    t.boolean "to_anrcho"
    t.boolean "to_dsa"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.text "body"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "anon_token"
    t.integer "group_id"
    t.integer "original_id"
    t.boolean "hidden"
    t.boolean "photoset"
    t.string "unique_token"
    t.boolean "un_invited"
    t.string "video"
    t.boolean "sound"
    t.string "audio"
    t.string "audio_name"
    t.boolean "featured"
    t.boolean "social_maya_only"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "unique_token"
    t.string "anon_token"
    t.string "group_token"
    t.integer "group_id"
    t.integer "proposal_id"
    t.string "title"
    t.text "body"
    t.string "image"
    t.string "action"
    t.string "revised_action"
    t.boolean "ratified"
    t.boolean "requires_revision"
    t.boolean "revised"
    t.integer "version"
    t.integer "ratification_point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "misc_data"
    t.integer "user_id"
    t.string "voting_type"
  end

  create_table "settings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.string "name"
    t.boolean "on"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shared_items", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.string "item_type"
    t.string "domain"
    t.string "size"
    t.string "aka"
    t.string "arrangement"
    t.string "originator"
    t.string "contact"
    t.string "address"
    t.string "in_stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "item_library_id"
    t.string "unique_token"
    t.string "video"
    t.boolean "photoset"
    t.integer "user_id"
    t.integer "item_category_id"
    t.integer "holder_id"
  end

  create_table "simple_captcha_data", force: :cascade do |t|
    t.string "key", limit: 40
    t.string "value", limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["key"], name: "idx_key"
  end

  create_table "sounds", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.string "name"
    t.string "audio"
    t.string "unique_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "post_id"
  end

  create_table "survey_answers", force: :cascade do |t|
    t.integer "survey_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "survey_result_id"
    t.text "question_body"
    t.integer "survey_question_id"
    t.boolean "other"
  end

  create_table "survey_questions", force: :cascade do |t|
    t.integer "survey_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "question_type", default: "open_ended"
    t.boolean "grid"
  end

  create_table "survey_results", force: :cascade do |t|
    t.integer "survey_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_selections", force: :cascade do |t|
    t.integer "survey_question_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "row"
    t.integer "survey_selection_id"
    t.boolean "other"
  end

  create_table "surveys", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "body"
    t.string "image"
    t.integer "user_id"
    t.text "questions"
    t.integer "group_id"
    t.string "unique_token"
  end

  create_table "tags", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.integer "group_id"
    t.integer "comment_id"
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "anon_token"
    t.integer "index"
    t.integer "proposal_id"
    t.integer "vote_id"
    t.integer "message_id"
    t.integer "shared_item_id"
    t.integer "item_library_id"
    t.integer "survey_id"
  end

  create_table "tests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "passphrase"
    t.binary "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth_token"
    t.string "image"
    t.text "body"
    t.string "email"
    t.string "password"
    t.string "password_salt"
    t.string "unique_token"
    t.boolean "dev"
    t.boolean "mod"
    t.integer "xp"
    t.datetime "last_active_at"
    t.boolean "hidden"
    t.string "title"
    t.boolean "guest"
    t.string "zodiac"
    t.integer "energy_points"
    t.string "geo_coordinates"
    t.string "location"
    t.boolean "featured"
    t.boolean "admin"
    t.boolean "dsa_member"
  end

  create_table "views", force: :cascade do |t|
    t.integer "user_id"
    t.string "anon_token"
    t.integer "group_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comment_id"
    t.integer "profile_id"
    t.string "ip_address"
    t.integer "proposal_id"
    t.integer "message_id"
    t.string "locale"
    t.integer "vote_id"
    t.integer "score_count"
    t.boolean "non_visible"
    t.boolean "click"
    t.integer "x_pos"
    t.integer "y_pos"
    t.integer "screen_width"
    t.integer "screen_height"
    t.integer "avail_screen_width"
    t.integer "avail_screen_height"
    t.integer "device_pixel_ratio"
    t.string "controller_name"
    t.string "action_name"
    t.string "current_url"
    t.integer "shared_item_id"
    t.integer "item_library_id"
    t.integer "survey_id"
  end

  create_table "votes", force: :cascade do |t|
    t.integer "proposal_id"
    t.integer "comment_id"
    t.integer "vote_id"
    t.string "unique_token"
    t.string "anon_token"
    t.text "body"
    t.string "flip_state"
    t.boolean "verified"
    t.integer "proposal_version"
    t.boolean "moot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "bot_id"
  end

end
