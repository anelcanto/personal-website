class Lead < ApplicationRecord
  # Ensure that name, email, and phone_number are present
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true, numericality: true, length: { minimum: 10, maximum: 15 }

  # You can add more details about the format you expect for the phone_number
  # For example, if you expect the phone_number to only contain digits,
  # you can use a regular expression to validate the format:
  validates :phone_number, format: { with: /\A\d+\z/, message: 'only allows numbers' }

  # You can also validate the uniqueness of email if you want each lead to have a unique email address
  validates :email, uniqueness: true
end

