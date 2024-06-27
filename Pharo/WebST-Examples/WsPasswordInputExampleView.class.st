Class {
	#name : #WsPasswordInputExampleView,
	#superclass : #WsBootstrap5View,
	#category : #'WebST-Examples-Text'
}

{ #category : #rendering }
WsPasswordInputExampleView >> renderOuterHtmlOn: html [

	html div
		class: 'input-group';
		with: [
			html passwordInput
				class: 'form-control border border-end-0'.
			html render: WsToggleIconsComponent with: [ :brush |
				brush
					class: 'btn border border-start-0';
					dataAttributes: {
							(#onIcon -> 'bi-eye-fill').
							(#offIcon -> 'bi-eye-slash-fill') } ] ]
]
