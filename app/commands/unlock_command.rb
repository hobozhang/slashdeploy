# UnlockCommand handles the `/deploy unlock` command.
class UnlockCommand < BaseCommand
  def run
    transaction do
      repo = Repository.with_name(params['repository'])
      env  = repo.environment(params['environment'])

      slashdeploy.unlock_environment(user.user, env)
      Slash.say UnlockedMessage.build \
        environment: env
    end
  end
end
