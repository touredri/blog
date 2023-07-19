# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'page content' do
    it 'should show the placeholder' do
      visit '/users'
      expect(page).to have_content('Hello world')
    end
  end
end
