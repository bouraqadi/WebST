Class {
	#name : #WsCounterView,
	#superclass : #WsBootstrap5View,
	#category : #'WebSt-Library-Counter'
}

{ #category : #rendering }
WsCounterView >> renderOuterHtmlOn: html [

	html div
		class: 'd-flex flex-column align-items-center p-1';
		with: [
			html div
				class: 'display me-1 text-center fs-1';
				with: [ html text: 0 ].
			html div
				class: 'btn-group';
				with: [
					html button
						bePush;
						class: 'increment btn btn-primary';
						value: '+'.
					html button
						bePush;
						class: 'decrement btn btn-info';
						value: '-'.
					html button
						bePush;
						class: 'reset btn btn-danger';
						value: 'x' ] ]
]
