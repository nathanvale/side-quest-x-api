/**
 * @side-quest/x-api — Read-only Twitter/X API v2 client.
 *
 * Provides a resilient client with retry, timeout, and rate limit awareness
 * for fetching tweets, threads, timelines, user profiles, and search results.
 *
 * @module @side-quest/x-api
 */

export {
	createXApiClient,
	TwitterApiError,
	type XApiClient,
	type XApiClientConfig,
} from './client'

export {
	formatReplies,
	formatSearch,
	formatThread,
	formatTimeline,
	formatTweet,
	formatUser,
} from './formatters'

export { mergeSingleTweet, mergeTweetList } from './includes'

export {
	buildThread,
	type RequestFn,
	type ThreadFieldParams,
} from './thread'

export type {
	EnrichedTweet,
	ReferencedTweet,
	RepliesResult,
	SearchResult,
	ThreadResult,
	TimelineResult,
	Tweet,
	TweetPublicMetrics,
	TwitterIncludes,
	TwitterMeta,
	TwitterV2ListResponse,
	TwitterV2Response,
	User,
	UserPublicMetrics,
} from './types'
