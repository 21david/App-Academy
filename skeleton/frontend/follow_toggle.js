function FollowToggle($el) {
    this.userId = $el.find("data-user-id");
    this.followState = $el.find("data-initial-follow-state");
    this.el = $el;
}

module.exports = FollowToggle;