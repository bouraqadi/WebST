Class {
	#name : #WsScoreView,
	#superclass : #WsBootstrap5View,
	#category : #'WebST-Examples-Misc'
}

{ #category : #rendering }
WsScoreView >> renderColumnOn: html with: contents [

	html div
		class: 'col';
		with: contents.
]

{ #category : #rendering }
WsScoreView >> renderOuterHtmlOn: html [
	html div
		class: 'd-flex flex-column align-items-center p-1';
		with: [
		html
			render: WsTextToggleEditComponent
			dataAttributes: { (#text -> 'Game Score') }.
		self renderRowOn: html with: [
			#( 'Player A' 'Player B' ) do: [ :name |
				self renderScoreOn: html playerName: name ] ] ]
]

{ #category : #rendering }
WsScoreView >> renderOuterHtmlOnDetails: html [

	html div
		class: 'd-flex flex-column align-items-center p-1';
		with: [
			html
				render: WsTextToggleEditComponent
				dataAttributes: { (#text -> 'Game Score') }.
			self renderRowOn: html with: [
					#( 'Player A' 'Player B' ) do: [ :name |
							self renderScoreOn: html playerName: name ] ] ]
]

{ #category : #rendering }
WsScoreView >> renderRowOn: html with: contents [

	html div
		class: 'row';
		with: contents
]

{ #category : #rendering }
WsScoreView >> renderScoreOn: html playerName: name [

	self renderColumnOn: html with: [
		html div
			class: 'text-center';
			with: [
				html
					render: WsTextToggleEditComponent
					dataAttributes: { (#text -> name) } ].
		html div with: [ html render: WsCounterComponent ] ]
]
