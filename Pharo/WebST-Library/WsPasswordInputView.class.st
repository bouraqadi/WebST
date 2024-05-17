Class {
	#name : #WsPasswordInputView,
	#superclass : #WsBootstrap5View,
	#category : #'WebST-Library-Text'
}

{ #category : #rendering }
WsPasswordInputView >> renderOuterHtmlOn: html [

	html div
		class: 'input-group';
		with: [
			html passwordInput
				class: 'form-control border border-end-0';
				placeholder: 'Password'.
			html render: WsToggleIconsComponent do: [ :brush |
				brush
					class: 'btn border border-start-0';
					dataAttributes: {
							(#onIcon -> 'bi-eye-fill').
							(#offIcon -> 'bi-eye-slash-fill') } ] ]
]
