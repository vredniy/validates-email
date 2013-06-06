require 'spec_helper'

describe 'ValidatesEmail' do
  context '#validates_email notation' do
    it 'should not be valid without an email' do
      User.new.should_not be_valid
    end

    it 'should be valid with right email' do
      User.new(email: 'kiesy@mail.ru').should be_valid
    end
  end

  context '#validates notation' do
    it 'should not be valid without an email' do
      Person.new.should_not be_valid
    end

    it 'should be valid with right email' do
      Person.new(email: 'kiesy@mail.ru').should be_valid
    end
  end
end
