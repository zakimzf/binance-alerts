#!/bin/bash
set -e

process_config() {

    # Please mount your own config file into the container for unsupported env parameters!
    # Currently not supported config paramenters: chartIntervals, outlierParams, pairsOfInterest, watchlist, tdpaIntervals

    if [[ -n $TELEGRAM_TOKEN ]]; then
        sed -i "s/telegramToken.*/telegramToken: ${TELEGRAM_TOKEN}/" config.yml
    fi
    if [[ -n $TELEGRAM_CHAT_ID ]]; then
        sed -i "s/telegramChatId.*/telegramChatId: ${TELEGRAM_CHAT_ID}/" config.yml
    fi
    if [[ -n $TELEGRAM_ALERT_CHAT_ID ]]; then
        sed -i "s/telegramAlertChatId.*/telegramAlertChatId: ${TELEGRAM_ALERT_CHAT_ID}/" config.yml
    fi

    if [[ -n $EXTRACT_INTERVAL ]]; then
        sed -i "s/extractInterval.*/extractInterval: ${EXTRACT_INTERVAL}/" config.yml
    fi

    if [[ -n $HARD_ALERT_INTERVAL_ENABLED ]]; then
    sed -i "s/hardAlertIntervalEnabled.*/hardAlertIntervalEnabled: ${HARD_ALERT_INTERVAL_ENABLED}/" config.yml
    fi
    if [[ -n $HARD_ALERT_MIN ]]; then
    sed -i "s/hardAlertMin.*/hardAlertMin: ${HARD_ALERT_MIN}/" config.yml
    fi

    if [[ -n $FUTURES_ENABLED ]]; then
        sed -i "s/futuresEnabled.*/futuresEnabled: ${FUTURES_ENABLED}/" config.yml
    fi
    if [[ -n $DUMP_ENABLED ]]; then
        sed -i "s/dumpEnabled.*/dumpEnabled: ${DUMP_ENABLED}/" config.yml
    fi
    
    if [[ -n $TOP_PUMP_ENABLED ]]; then
        sed -i "s/topPumpEnabled.*/topPumpEnabled: ${TOP_PUMP_ENABLED}/" config.yml
    fi
    if [[ -n $TOP_DUMP_ENABLED ]]; then
        sed -i "s/topDumpEnabled.*/topDumpEnabled: ${TOP_DUMP_ENABLED}/" config.yml
    fi
    if [[ -n $ADDITIONAL_STATS_ENABLED ]]; then
        sed -i "s/additionalStatsEnabled.*/additionalStatsEnabled: ${ADDITIONAL_STATS_ENABLED}/" config.yml
    fi
    if [[ -n $VIEW_NUMBER ]]; then
        sed -i "s/viewNumber.*/viewNumber: ${VIEW_NUMBER}/" config.yml
    fi

    if [[ -n $BOT_EMOJI ]]; then
        sed -i "s/botEmoji.*/botEmoji: ${BOT_EMOJI}/" config.yml
    fi
    if [[ -n $PUMP_EMOJI ]]; then
        sed -i "s/pumpEmoji.*/pumpEmoji: ${PUMP_EMOJI}/" config.yml
    fi
    if [[ -n $DUMP_EMOJI ]]; then
        sed -i "s/dumpEmoji.*/dumpEmoji: ${DUMP_EMOJI}/" config.yml
    fi
    if [[ -n $TDPA_EMOJI ]]; then
        sed -i "s/tdpaEmoji.*/tdpaEmoji: ${TDPA_EMOJI}/" config.yml
    fi
    if [[ -n $NEW_LISTING_EMOJI ]]; then
        sed -i "s/newListingEmoji.*/newListingEmoji: ${NEW_LISTING_EMOJI}/" config.yml
    fi

    if [[ -n $DEBUG ]]; then
        sed -i "s/debug.*/debug: ${DEBUG}/" config.yml
    fi
    if [[ -n $RESET_INTERVAL ]]; then
        sed -i "s/resetInterval.*/resetInterval: ${RESET_INTERVAL}/" config.yml
    fi
    if [[ -n $PRICE_RETRY_INTERVAL ]]; then
        sed -i "s/priceRetryInterval.*/priceRetryInterval: ${PRICE_RETRY_INTERVAL}/" config.yml
    fi
    if [[ -n $TELEGRAM_RETRY_INTERVAL ]]; then
        sed -i "s/telegramRetryInterval.*/telegramRetryInterval: ${TELEGRAM_RETRY_INTERVAL}/" config.yml
    fi
    if [[ -n $TDPA_INITIAL_BUFFER ]]; then
        sed -i "s/tdpaInitialBuffer.*/tdpaInitialBuffer: ${TDPA_INITIAL_BUFFER}/" config.yml
    fi
    if [[ -n $CHECK_NEW_LISTING_ENABLED ]]; then
        sed -i "s/checkNewListingEnabled.*/checkNewListingEnabled: ${CHECK_NEW_LISTING_ENABLED}/" config.yml
    fi
}

# Adding parameters set from the environment variables to the config yaml file.
process_config

echo 
echo "Running $@"
echo

exec "$@"