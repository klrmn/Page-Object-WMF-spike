
require 'spec_helper'

describe "check Edit mode" do
  context "visit an article" do
    before(:each) do
      visit_page(ProofreadPage)
    end

    it "should display messages before and after clicking edit" do
      @current_page.text.should include "This page has not been proofread"
      @current_page.edit
      @current_page.text.should include "Warning: You are not logged in"
      @current_page.article_text.should be_true
    end

    context "on article Edit tab" do
      before(:each) do
        @current_page.edit
      end

      # after(:each) do
      #   # this isn't working
      #   # once it works, spec_helper can be changed back to :all rather than :each
      #   @current_page.confirm(true) do
      #       @current_page.cancel_element.click
      #   end
      # end

      # i would have liked to abstract these actions into a method that takes
      # which button to push and what text to expect, but i couldn't figure out
      # how to make it go with rspec
      it "should modify text upon clicking bold button" do
        @current_page.bold.should be_true
        5.times { @current_page.article_text_element.send_keys :arrow_right }
        @current_page.bold_element.click
        @current_page.article_text.should include "'''Bold text'''"
      end

      it "should modify text upon clicking italic button" do
        @current_page.italic.should be_true
        5.times { @current_page.article_text_element.send_keys :arrow_right }
        @current_page.italic_element.click
        @current_page.article_text.should include "''Italic text''"
      end

      it "should modify test upon clicking embedded file button" do
        @current_page.embedded.should be_true
        5.times { @current_page.article_text_element.send_keys :arrow_right }
        @current_page.embedded_element.click
        @current_page.article_text.should include "[[File:Example.jpg]]"
      end

      it "should modify test upon clicking signature button" do
        @current_page.embedded.should be_true
        5.times { @current_page.article_text_element.send_keys :arrow_right }
        @current_page.signature_element.click
        @current_page.article_text.should include "--~~~~"
      end

      context "link button pushed" do
        it "should insert local link"
        it "should insert remote link"
        it "should return upon cancel"
        it "should return upon close"
        it "should use alternate text"
      end

      context "reference button pushed" do
        it "should insert reference"
        it "should return upon cancel"
        it "should return upon close"
      end

      context "advanced toolbar" do

        context "header tool" do
          it "should insert h2"
          it "should insert h3"
          it "should insert h4"
          it "should insert h5"
          it "should be dismissable"
        end

        context "multiple lines selected" do

          it "should bullet list"

          context "bulleted list" do
            it "should indent once"
            it "should indent twice"
          end

          it "should numbered list"

          context "numbered list" do
            it "should indent once"
            it "should indent twice"
          end

          it "should indent once"
          it "should indent twice"

        end

        context "selected text has formatting" do
          it "should remove formatting"
        end

        it "should add br"

        context "text selected" do
          it "should big the text"
          it "should small the text"
          it "should superscript the text"
          it "should subscript the text"
        end

        it "should add redirect"
        it "should add table"
        it "should search and replace"

      end # context advanced toolbar

      context "special characters toolbar" do
        # repeat for three languages
        context "first language" do
          it "should first char"
          it "should second char"
          it "should third char"
        end
      end # special characters toolbar

      context "help toolbar" do
        # repeat for 3 links
        it "should display help"
      end

      context "proofreading toolbar" do
        it "should zoom in"
        it "should zoom out"
        it "should original size"
        it "should hide/show header and footer"
        it "should change layout"
      end # proofreading toolbar

    end # inner context (edit tab)
  end # outer context (article)
end #describe
