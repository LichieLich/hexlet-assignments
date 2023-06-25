# frozen_string_literal: true

class Web::RepositoriesController < Web::ApplicationController
  def index
    @repositories = Repository.all
  end

  def new
    @repository = Repository.new
  end

  def show
    @repository = Repository.find params[:id]
  end

  def create
    # BEGIN
    RepositoryLoaderJob.perform_later(params[:repository][:link])
    # END
  end

  def update
    # BEGIN
    @repository = Repository.find(params[:id])
    RepositoryLoaderJob.perform_later(@repository.link)
    # END
  end

  def update_repos
    # BEGIN
    @repositories = Repository.order(:created_at)

    @repositories.each do |repo|
      RepositoryLoaderJob.perform_later(repo.link)
    end
    # END
  end

  def destroy
    @repository = Repository.find params[:id]

    if @repository.destroy
      redirect_to repositories_path, notice: t('success')
    else
      redirect_to repositories_path, notice: t('fail')
    end
  end

  private

  def permitted_params
    params.require(:repository).permit(:link)
  end
end
