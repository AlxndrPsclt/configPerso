// ==UserScript==
// @name          nordtube
// @namespace     http://userstyles.org
// @description	  🎨 youtube theme based on the nord color scheme
// @author        imsheep
// @homepage      https://userstyles.org/styles/202840
// @include       http://youtube.com/*
// @include       https://youtube.com/*
// @include       http://*.youtube.com/*
// @include       https://*.youtube.com/*
// @run-at        document-start
// @version       0.20210505120927
// ==/UserScript==
(function() {var css = [
	"#container.ytd-masthead {",
	"    background-color: #2e3340",
	"}",
	"",
	"ytd-watch-flexy[flexy][is-two-columns_] #columns.ytd-watch-flexy {",
	"    background-color: #2e3340",
	"}",
	"",
	"#like-button {",
	"    color: #5e81ac",
	"}",
	"",
	"tp-yt-paper-button.ytd-subscribe-button-renderer[subscribed] {",
	"    color: #d8dee9;",
	"    background-color: #4c566a;",
	"    border-radius: 20px;",
	"}",
	"",
	"tp-yt-paper-button.ytd-subscribe-button-renderer {",
	"    background-color: #5e81ac;",
	"    color: #d8dee9;",
	"    border-radius: 20px;",
	"}",
	"",
	"ytd-subscription-notification-toggle-button-renderer #button.ytd-subscription-notification-toggle-button-renderer {",
	"    color: #d8dee9",
	"}",
	"",
	".sbsb_a, .sbdd_b {",
	"    display: none;",
	"}",
	"",
	"#container.ytd-searchbox {",
	"    background-color: #2e3340;",
	"    color: #d8dee9;",
	"    BORDER: NONE;",
	"}",
	"",
	"#search-icon-legacy.ytd-searchbox {",
	"    background-color: #2e3340",
	"}",
	"",
	"#search-icon-legacy.ytd-searchbox {",
	"    color: #d8dee9;",
	"    border: none;",
	"}",
	"",
	"#search-icon-legacy.ytd-searchbox yt-icon.ytd-searchbox {",
	"    color: #D8DEE9 !iMPORTANT;",
	"}",
	"",
	"#notification-count.ytd-notification-topbar-button-renderer {",
	"    BACKGROUND-COLOR: #5E81AC",
	"}",
	"",
	"ytd-toggle-button-renderer.force-icon-button a.ytd-toggle-button-renderer {",
	"    color: #5e81ac",
	"}",
	"",
	"ytd-toggle-button-renderer.style-text[is-icon-button] #text.ytd-toggle-button-renderer {",
	"    color: #d8dee9",
	"}",
	"",
	"#like-bar.ytd-sentiment-bar-renderer {",
	"    background-color: #5e81ac",
	"}",
	"",
	"ytd-button-renderer #button.ytd-button-renderer {",
	"    color: #d8dee9",
	"}",
	"",
	"ytd-button-renderer.style-text[is-icon-button] #text.ytd-button-renderer, ytd-button-renderer.style-default[is-icon-button] #text.ytd-button-renderer, ytd-button-renderer.style-opacity[is-icon-button] #text.ytd-button-renderer {",
	"    color: #d8dee9",
	"}",
	"",
	"#button.ytd-menu-renderer yt-icon.ytd-menu-renderer {",
	"    color: #d8dee9",
	"}",
	"",
	"#chat-messages.yt-live-chat-renderer, #contents.yt-live-chat-renderer, #item-list.yt-live-chat-renderer {",
	"    background-color: #2e3340",
	"}",
	"",
	"#contentWrapper.tp-yt-iron-dropdown > * {",
	"    background-color: #2e3340",
	"}",
	"",
	"ytd-active-account-header-renderer {",
	"    background-color: #2e3340",
	"}",
	"",
	"yt-icon.ytd-compact-link-renderer, yt-icon.ytd-toggle-theme-compact-link-renderer {",
	"    color: #d8dee9",
	"}",
	"",
	"ytd-button-renderer.style-suggestive[is-paper-button] {",
	"    background-color: #81a1c1;",
	"}",
	"",
	"ytd-button-renderer.style-suggestive[is-paper-button] paper-button.ytd-button-renderer {",
	"    border: none;",
	"}",
	"",
	"a.ytd-rich-metadata-renderer {",
	"    background-color: #2e3340",
	"}",
	"",
	"#chips.yt-chip-cloud-renderer {",
	"    display: none;",
	"}",
	"",
	"ytd-thumbnail #thumbnail.ytd-thumbnail {",
	"    border-radius: 20px;",
	"}",
	"",
	"ytd-thumbnail.ytd-rich-grid-media, ytd-thumbnail.ytd-rich-grid-media::before {",
	"    border-radius: 20px;",
	"}",
	"",
	"yt-icon.ytd-badge-supported-renderer {",
	"    color: #5e81ac;",
	"}",
	"",
	"#owner-sub-count.ytd-video-owner-renderer, yt-formatted-string.ytd-video-primary-info-renderer, span.ytd-video-view-count-renderer {",
	"    color: #d8dee9",
	"}",
	"",
	"ytd-menu-popup-renderer {",
	"    border-radius: 20px;",
	"}",
	"",
	"tp-yt-paper-listbox {",
	"    background-color: #2e3340;",
	"}",
	"",
	"yt-icon.ytd-menu-service-item-renderer {",
	"    color: #d8dee9",
	"}",
	"",
	"#chips.ytd-feed-filter-chip-bar-renderer, ytd-feed-filter-chip-bar-renderer {",
	"    display: none;",
	"}",
	"",
	"ytd-rich-grid-renderer {",
	"    background-color: #2e3340",
	"}",
	"",
	"#content.ytd-rich-section-renderer > .ytd-rich-section-renderer {",
	"    display: none;",
	"}",
	"",
	"ytd-mini-guide-renderer.ytd-app {",
	"    background-color: #2e3340",
	"}",
	"",
	"ytd-watch-flexy[flexy][is-two-columns_] #columns.ytd-watch-flexy {",
	"    margin-left: 0;",
	"    margin-right: 0 !important;",
	"}",
	"",
	"ytd-watch-flexy[flexy][flexy-large-window_]:not([is-extra-wide-video_]), ytd-watch-flexy[flexy][flexy-large-window_][transcript-opened_][is-two-columns_]:not([is-extra-wide-video_]), ytd-watch-flexy[flexy][flexy-large-window_][playlist][is-two-columns_]:not([is-extra-wide-video_]), ytd-watch-flexy[flexy][flexy-large-window_][should-stamp-chat][is-two-columns_]:not([is-extra-wide-video_]) {",
	"    background-color: #2e3340",
	"}",
	"",
	"ytd-live-chat-frame {",
	"    border: none;",
	"}",
	"",
	"#show-hide-button.ytd-live-chat-frame > ytd-toggle-button-renderer.ytd-live-chat-frame{",
	"    background-color: #2e3340;",
	"    color: #d8dee9;",
	"}",
	"",
	"ytd-button-renderer.style-suggestive[is-paper-button]  {",
	"    border-radius: 20px;",
	"}",
	"",
	".fit.tp-yt-paper-dialog-scrollable, #top-bar.ytd-sponsorships-offer-renderer {",
	"    background-color: #2e3340",
	"}",
	"",
	"yt-button-renderer #button.yt-button-renderer {",
	"    background-color: #81a1c1",
	"}",
	"",
	"yt-button-renderer #button.yt-button-renderer {",
	"    color: #d8dee9",
	"}",
	"",
	"yt-button-renderer.style-primary[is-paper-button] {",
	"    border-radius: 20px;",
	"}",
	"",
	".fit.tp-yt-paper-dialog-scrollable  {",
	"    border-radius: 20px;",
	"}",
	"",
	"a.yt-simple-endpoint.yt-formatted-string {",
	"    color: #5e81ac",
	"}",
	"",
	"a.yt-simple-endpoint.yt-formatted-string:hover {",
	"    color: #81a1c1",
	"}",
	"",
	"ytd-simple-menu-header-renderer {",
	"    background-color: #2e3340",
	"}",
	"",
	"#text.ytd-channel-name, #metadata-line.ytd-video-meta-block span.ytd-video-meta-block {",
	"    color: #d8dee9",
	"}",
	"",
	".badge-style-type-simple.ytd-badge-supported-renderer {",
	"    background: #3b4252 !Important;",
	"}",
	"",
	".badge-style-type-simple.ytd-badge-supported-renderer {",
	"    color: #d8dee9",
	"}",
	"",
	".badge-style-type-simple.ytd-badge-supported-renderer {",
	"    border-radius: 20px;",
	"}",
	"",
	"#country-code.ytd-topbar-logo-renderer {",
	"    display: none;",
	"}",
	"",
	"ytd-author-comment-badge-renderer[creator] {",
	"    background-color: #5e81ac",
	"}",
	"",
	"#like-button.ytd-comment-action-buttons-renderer {",
	"    color: #5e81ac",
	"}",
	"",
	"#dislike-button.ytd-comment-action-buttons-renderer {",
	"    color: #81a1c1",
	"}",
	"",
	"#label.ytd-pinned-comment-badge-renderer, yt-formatted-string[has-link-only_]:not([force-default-style]) a.yt-simple-endpoint.yt-formatted-string {",
	"    color: #d8dee9",
	"}",
	"",
	"#label-icon.yt-dropdown-menu, #icon-label.yt-dropdown-menu, #simplebox-placeholder.ytd-comment-simplebox-renderer, .more-button.ytd-video-secondary-info-renderer, .less-button.ytd-video-secondary-info-renderer {",
	"    color: #d8dee9 !important;",
	"}",
	"",
	"#voice-search-button.ytd-masthead .ytd-masthead[is-icon-button] {",
	"    display: none;",
	"}",
	"",
	"#placeholder-area.ytd-comment-simplebox-renderer, #input-container.ytd-commentbox {",
	"    border: none;",
	"}",
	"",
	"ytd-commentbox {",
	"    border: none;",
	"}",
	"",
	"ytd-button-renderer.style-primary[is-paper-button] {",
	"    background-color: #5e81ac;",
	"    border-radius: 20px;",
	"}",
	"",
	"#sections.ytd-guide-renderer > ytd-guide-section-renderer.ytd-guide-renderer:not(:first-child), #sections.ytd-guide-renderer > ytd-guide-subscriptions-section-renderer.ytd-guide-renderer {",
	"    background-color: #2e3340;",
	"    border-bottom: none;",
	"}",
	"",
	"#sections.ytd-guide-renderer > .ytd-guide-renderer:not(:last-child) {",
	"    background-color: #2e3340;",
	"    border-bottom: none;",
	"}",
	"",
	"ytd-app:not([background-color-update_]) tp-yt-app-drawer.ytd-app:not([persistent]).ytd-app #header.ytd-app {",
	"    background-color: #2e3340;",
	"    border-bottom: none;",
	"}",
	"",
	".guide-icon.ytd-guide-entry-renderer {",
	"    color: #d8dee9",
	"}",
	"",
	"#guide-section-title.ytd-guide-section-renderer {",
	"    color: #d8dee9",
	"}",
	"",
	"#guide-links-primary.ytd-guide-renderer, #guide-links-secondary.ytd-guide-renderer, #footer.ytd-guide-renderer > #copyright {",
	"    background-color: #2e3340",
	"}",
	"",
	"#footer.ytd-guide-renderer > #copyright, #guide-links-primary.ytd-guide-renderer > a, #guide-links-secondary.ytd-guide-renderer > a, .metadata.ytd-notification-renderer {",
	"    color: #d8dee9",
	"}",
	"",
	"#contentWrapper.tp-yt-iron-dropdown > * {",
	"    border: none;",
	"    border-radius: 20px;",
	"}",
	"",
	"ytd-simple-menu-header-renderer {",
	"    border: none;",
	"}",
	"",
	"#vote-count-middle.ytd-comment-action-buttons-renderer {",
	"    color: #d8dee9",
	"}",
	"",
	"channel-header.ytd-c4-tabbed-header-renderer {",
	"    background-color: #3b4252",
	"}",
	"",
	"#header.ytd-browse, #tabs-inner-container.ytd-c4-tabbed-header-renderer {",
	"    background-color: #3b4252",
	"}",
	"",
	"ytd-page-manager > .ytd-page-manager {",
	"    background-color: #2e3340",
	"}",
	"",
	".tab-content.tp-yt-paper-tab, tp-yt-paper-tab.iron-selected.ytd-c4-tabbed-header-renderer {",
	"    color: #d8dee9",
	"}",
	"",
	"ytd-playlist-thumbnail #thumbnail.ytd-playlist-thumbnail {",
	"    border-radius: 20px;",
	"}",
	"",
	"#metadata.ytd-channel-renderer, #description.ytd-channel-renderer, #subscriber-count.ytd-c4-tabbed-header-renderer {",
	"    color: #d8dee9",
	"}",
	"",
	"ytd-backstage-post-thread-renderer {",
	"    border: none;",
	"}",
	"",
	".progress-bar.ytd-backstage-poll-renderer {",
	"    background-color: #4c556a;",
	"    border-radius: 5px;",
	"}",
	"",
	"ytd-backstage-poll-renderer[show-poll-choice-border] tp-yt-paper-item.ytd-backstage-poll-renderer[show-percentage] .choice-info.ytd-backstage-poll-renderer {",
	"    border: none;",
	"}",
	"",
	"yt-icon.checked.ytd-backstage-poll-renderer {",
	"    color: #5e81ac",
	"}",
	"",
	"tp-yt-paper-item.ytd-backstage-poll-renderer[selected] .progress-bar.ytd-backstage-poll-renderer {",
	"    background-color: #5e81ac;",
	"    border-radius: 5px;",
	"}",
	"",
	"yt-icon.ytd-backstage-poll-renderer, #vote-info.ytd-backstage-poll-renderer {",
	"    color: #d8dee9",
	"}",
	"",
	"ytd-backstage-poll-renderer[show-poll-choice-border] .choice-info.ytd-backstage-poll-renderer {",
	"    border: none;",
	"}",
	"",
	"ytd-clarification-renderer[background-style=\"info\"] {",
	"    display: none;",
	"}",
	"",
	"ytd-video-primary-info-renderer {",
	"    border: none;",
	"}",
	"",
	"yt-live-chat-header-renderer {",
	"    background-color: #2e3340;",
	"}",
	"",
	"yt-live-chat-banner-manager.yt-live-chat-item-list-renderer {",
	"     display: none; ",
	"}",
	"",
	"#menu.yt-live-chat-text-message-renderer {",
	"    background: #2e3340;",
	"    color: #d8dee9;",
	"    }",
	"    yt-live-chat-viewer-engagement-message-renderer, #card.yt-live-chat-viewer-engagement-message-renderer {",
	"    background: #2e3340",
	"}",
	"",
	"#author-name.yt-live-chat-author-chip {",
	"    color: #d8dee9",
	"}",
	"",
	"yt-icon-button.yt-live-chat-item-list-renderer {",
	"    background-color: #5e81ac",
	"}",
	"",
	"#items.yt-live-chat-ticker-renderer {",
	"    background: #2e3340",
	"}",
	"    paper-button.yt-next-continuation {",
	"    color: #81a1c1",
	"}",
	"    ",
	"    #progress.ytd-thumbnail-overlay-resume-playback-renderer {",
	"    background-color: #5e81ac",
	"    }",
	"    ",
	"    .super-title-icon.ytd-video-primary-info-renderer {",
	"    color: #5e81ac",
	"    }",
	"    ytd-mini-guide-entry-renderer {",
	"    background: #2e3340",
	"}",
	"    ",
	".guide-icon.ytd-mini-guide-entry-renderer, .title.ytd-mini-guide-entry-renderer {",
	"    color: #d8dee9",
	"    }",
	"    ytd-searchbox[has-focus] #container.ytd-searchbox {",
	"    border: none;",
	"    box-shadow: none;",
	"    }",
	"    yt-live-chat-text-message-renderer[author-is-owner] {",
	"    background: #2e3340",
	"}",
	"",
	"yt-live-chat-author-chip[is-highlighted] #author-name.owner.yt-live-chat-author-chip, #author-name.owner.yt-live-chat-author-chip {",
	"    background-color: #5e81ac;",
	"    color: #d8dee9;",
	"    border-radius: 15px;",
	"    }",
	"    ytd-button-renderer.style-suggestive[is-paper-button] tp-yt-paper-button.ytd-button-renderer {",
	"    border: none;",
	"    }",
	"    #header-section.ytd-donation-shelf-renderer, #donate-section.ytd-donation-shelf-renderer, #creator-messages-section.ytd-donation-shelf-renderer, #nonprofit-section.ytd-donation-shelf-renderer, #collapse-controls-section.ytd-donation-shelf-renderer {",
	"    background-color: #2e3340",
	"}",
	"",
	"#collapse-controls-section.ytd-donation-shelf-renderer, #creator-messages-section.ytd-donation-shelf-renderer, #nonprofit-section.ytd-donation-shelf-renderer, ytd-donation-shelf-renderer  {",
	"    border: none !important;",
	"}",
	"",
	"#header-section.ytd-donation-shelf-renderer {",
	"    border-bottom: none !Important;",
	"}",
	"",
	"#progress-bar-fill.ytd-donation-shelf-renderer {",
	"    background-color: #81a1c1",
	"}",
	"",
	"#progress-bar.ytd-donation-shelf-renderer {",
	"    background-color: #3b4252",
	"}",
	"",
	".creator-message.ytd-donation-shelf-renderer, #campaign-subtitle.ytd-donation-shelf-renderer, #nonprofit-description.ytd-donation-shelf-renderer, #nonprofit-subtitle.ytd-donation-shelf-renderer, #collapse-controls-section.ytd-donation-shelf-renderer {",
	"    color: #d8dee9",
	"}",
	"",
	"#nonprofit-title.ytd-donation-shelf-renderer yt-icon.ytd-donation-shelf-renderer {",
	"    color: #81a1c1",
	"}",
	"",
	".badge-style-type-ypc.ytd-badge-supported-renderer {",
	"    color: #a3be8c",
	"}",
	"",
	".badge-style-type-ypc.ytd-badge-supported-renderer {",
	"    background-color: #4c556a;",
	"    border-radius: 20px;",
	"    }",
	"    hearted.ytd-creator-heart-renderer, #hearted-border.ytd-creator-heart-renderer {",
	"    color: #5e81ac",
	"    }",
	"    #logo-icon > svg > g > g:nth-child(1) > path{",
	"    fill: #5e81ac;",
	"    }",
	"    .badge-style-type-live-now.ytd-badge-supported-renderer, .badge-style-type-starting-soon.ytd-badge-supported-renderer {",
	"    background: #bf616a;",
	"    color: #d8dee9;",
	"    border: none;",
	"    border-radius: 5px;",
	"    }",
	"    #like-button.ytd-comment-action-buttons-renderer.style-default-active {",
	"    color: #88c0d0;",
	"}",
	"",
	"#dislike-button.ytd-comment-action-buttons-renderer.style-default-active {",
	"    color: #88c0d0;",
	"    }",
	"    #header.ytd-add-to-playlist-renderer, ytd-add-to-playlist-renderer[dialog] #close-button.ytd-add-to-playlist-renderer, #playlists.ytd-add-to-playlist-renderer, ytd-compact-link-renderer:not([has-secondary]) tp-yt-paper-item.ytd-compact-link-renderer {",
	"    background-color: #2e3340;",
	"    color: #d8dee9;",
	"    border: none;",
	"}",
	"",
	"yt-icon.ytd-playlist-add-to-option-renderer {",
	"    color: #d8dee9",
	"    }",
	"    ytd-topbar-menu-button-renderer #button.ytd-topbar-menu-button-renderer {",
	"    display: none !important;",
	"}",
	"",
	"yt-live-chat-message-input-renderer {",
	"    background: #2e3340;",
	"    color: #d8dee9;",
	"}",
	"",
	"#picker-buttons.yt-live-chat-message-input-renderer > .yt-live-chat-message-input-renderer {",
	"    color: #d8dee9",
	"}",
	"",
	"yt-button-renderer #button.yt-button-renderer {",
	"    border-radius: 20px;",
	"}",
	"",
	"#label.yt-live-chat-text-input-field-renderer {",
	"    color: #d8dee9",
	"}",
	"",
	"#unfocused.yt-live-chat-text-input-field-renderer {",
	"    display: none;",
	"}",
	"",
	"#focused.yt-live-chat-text-input-field-renderer {",
	"    background-color: #81a1c1",
	"    }",
	"    ytd-sentiment-bar-renderer[activated] #like-bar.ytd-sentiment-bar-renderer {",
	"    background-color: #5e81ac",
	"    }",
	"    .cont-button.ytd-comment-replies-renderer {",
	"        color: #81a1c1",
	"    }"
].join("\n");
if (typeof GM_addStyle != "undefined") {
	GM_addStyle(css);
} else if (typeof PRO_addStyle != "undefined") {
	PRO_addStyle(css);
} else if (typeof addStyle != "undefined") {
	addStyle(css);
} else {
	var node = document.createElement("style");
	node.type = "text/css";
	node.appendChild(document.createTextNode(css));
	var heads = document.getElementsByTagName("head");
	if (heads.length > 0) {
		heads[0].appendChild(node);
	} else {
		// no head yet, stick it whereever
		document.documentElement.appendChild(node);
	}
}
})();
